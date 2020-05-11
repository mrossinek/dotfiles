require 'cairo'
require 'imlib2'

-- prints a font awesome icon
function print_icon(cr, icon, size, xpos, ypos, red, green, blue, alpha)
    local extents = cairo_text_extents_t:create()
    tolua.takeownership(extents)

    cairo_select_font_face(cr, "Font Awesome 5 Free", CAIRO_FONT_SLANT_NORMAL,
                           CAIRO_FONT_WEIGHT_BOLD)
    cairo_set_font_size(cr, size)

    cairo_text_extents(cr, icon, extents)
    x = xpos - (extents.width / 2 + extents.x_bearing)
    y = ypos - (extents.height / 2 + extents.y_bearing)
    cairo_move_to(cr, x, y)
    cairo_set_source_rgba(cr, red, green, blue, alpha)
    cairo_show_text(cr, icon)
    cairo_stroke(cr)
end

-- prints normal text
function print_text(cr, text, size, align, xpos, ypos, red, green, blue, alpha,
                    bold)
    local extents = cairo_text_extents_t:create()
    tolua.takeownership(extents)

    if bold == 'bold' then
        weight = CAIRO_FONT_WEIGHT_BOLD
    else
        weight = CAIRO_FONT_WEIGHT_NORMAL
    end
    cairo_select_font_face(cr, "MesloLGS Nerd Font Mono",
                           CAIRO_FONT_SLANT_NORMAL, weight)
    cairo_set_font_size(cr, size)

    cairo_text_extents(cr, text, extents)
    if align == 'center' then
        x = xpos - (extents.width / 2 + extents.x_bearing)
        y = ypos - (extents.height / 2 + extents.y_bearing)
    else
        x, y = xpos, ypos
    end
    cairo_move_to(cr, x, y)
    cairo_set_source_rgba(cr, red, green, blue, alpha)
    cairo_show_text(cr, text)
    cairo_stroke(cr)
end

-- computes the origin of a hexagon given the coordinates of a specified corner
function compute_hexagon_origin(corner, xpos, ypos, edge)
    local height = math.sqrt(3) * edge / 2
    if corner == 0 then
        origin_x, origin_y = xpos, ypos
    elseif corner == 1 then
        origin_x, origin_y = xpos + edge, ypos
    elseif corner == 2 then
        origin_x, origin_y = xpos + edge / 2, ypos + height
    elseif corner == 3 then
        origin_x, origin_y = xpos - edge / 2, ypos + height
    elseif corner == 4 then
        origin_x, origin_y = xpos - edge, ypos
    elseif corner == 5 then
        origin_x, origin_y = xpos - edge / 2, ypos - height
    elseif corner == 6 then
        origin_x, origin_y = xpos + edge / 2, ypos - height
    end
    return origin_x, origin_y
end

-- draws a hexagon from a given corner position
function draw_hexagon(cr, corner, xpos, ypos, edge, red, green, blue, alpha)
    origin_x, origin_y = compute_hexagon_origin(corner, xpos, ypos, edge)
    local height = math.sqrt(3) * edge / 2
    cairo_move_to(cr, origin_x - edge, origin_y)
    cairo_line_to(cr, origin_x - edge / 2, origin_y - height)
    cairo_line_to(cr, origin_x + edge / 2, origin_y - height)
    cairo_line_to(cr, origin_x + edge, origin_y)
    cairo_line_to(cr, origin_x + edge / 2, origin_y + height)
    cairo_line_to(cr, origin_x - edge / 2, origin_y + height)
    cairo_line_to(cr, origin_x - edge, origin_y)
    cairo_set_source_rgba(cr, red, green, blue, alpha)
    cairo_stroke(cr)
end

-- annotates a hexagon with a horizontal line at the speicifed corner
function annotate_hexagon(cr, corner, origin_x, origin_y, edge, x_end, red,
                          green, blue, alpha)
    local fac = 6 / 5
    local height = math.sqrt(3) * edge / 2
    if corner == 1 then
        cairo_move_to(cr, origin_x - edge, origin_y)
        cairo_line_to(cr, x_end, origin_y)
    elseif corner == 2 then
        cairo_move_to(cr, origin_x - edge / 2, origin_y - height)
        cairo_line_to(cr, origin_x - edge / 2 * fac, origin_y - height * fac)
        cairo_line_to(cr, x_end, origin_y - height * fac)
    elseif corner == 3 then
        cairo_move_to(cr, origin_x + edge / 2, origin_y - height)
        cairo_line_to(cr, origin_x + edge / 2 * fac, origin_y - height * fac)
        cairo_line_to(cr, x_end, origin_y - height * fac)
    elseif corner == 4 then
        cairo_move_to(cr, origin_x + edge, origin_y)
        cairo_line_to(cr, x_end, origin_y)
    elseif corner == 5 then
        cairo_move_to(cr, origin_x + edge / 2, origin_y + height)
        cairo_line_to(cr, origin_x + edge / 2 * fac, origin_y + height * fac)
        cairo_line_to(cr, x_end, origin_y + height * fac)
    elseif corner == 6 then
        cairo_move_to(cr, origin_x - edge / 2, origin_y + height)
        cairo_line_to(cr, origin_x - edge / 2 * fac, origin_y + height * fac)
        cairo_line_to(cr, x_end, origin_y + height * fac)
    end
    cairo_set_source_rgba(cr, red, green, blue, alpha)
    cairo_stroke(cr)
end

-- fills the percentage area of a specified hexagon
function fill_hexagon(cr, corner, xpos, ypos, edge, percent, red, green, blue,
                      alpha)
    origin_x, origin_y = compute_hexagon_origin(corner, xpos, ypos, edge)
    local height = math.sqrt(3) * edge / 2

    cairo_move_to(cr, origin_x - edge / 2, origin_y + height)
    if percent >= 50 then
        x_offset = height * (percent - 50) / 50 * math.sqrt(3) / 3
        cairo_line_to(cr, origin_x - edge, origin_y)
        cairo_line_to(cr, origin_x - (edge - x_offset),
                      origin_y - height * (percent - 50) / 50)
        cairo_line_to(cr, origin_x + (edge - x_offset),
                      origin_y - height * (percent - 50) / 50)
        cairo_line_to(cr, origin_x + edge, origin_y)
    else
        x_offset = height * (1 - percent / 50) * math.sqrt(3) / 3
        cairo_line_to(cr, origin_x - (edge - x_offset),
                      origin_y + height * (1 - percent / 50))
        cairo_line_to(cr, origin_x + (edge - x_offset),
                      origin_y + height * (1 - percent / 50))
    end
    cairo_line_to(cr, origin_x + edge / 2, origin_y + height)
    cairo_close_path(cr)
    cairo_set_source_rgba(cr, red, green, blue, alpha)
    cairo_fill(cr)
    cairo_stroke(cr)

    text = tostring(percent) .. "%"
    print_text(cr, text, 20, "center", origin_x, origin_y, 1, 1, 1, 1, "normal")
end

function conky_time(cr)
    cairo_translate(cr, 200, 0)

    draw_hexagon(cr, 0, 320, 115, 80, 0.7, 0.7, 0.7, 1)
    print_text(cr, conky_parse("${time %I:%M}"), 40, "center", 320, 115, 1, 1,
               1, 1, "bold")

    annotate_hexagon(cr, 1, 320, 115, 80, 15, 0.7, 0.7, 0.7, 1)
    print_text(cr, conky_parse("${kernel}"), 20, "left", 20, 25, 1, 1, 1, 1,
               "normal")
    annotate_hexagon(cr, 2, 320, 115, 80, 15, 0.7, 0.7, 0.7, 1)
    print_text(cr, conky_parse("${uptime_short}"), 20, "left", 20, 110, 1, 1, 1,
               1, "normal")
    annotate_hexagon(cr, 6, 320, 115, 80, 15, 0.7, 0.7, 0.7, 1)
    print_text(cr, conky_parse("${time %a %b %d}"), 20, "left", 20, 190, 1, 1,
               1, 1, "normal")

    local file = io.popen("cal -m | tail -n +2")
    local line = file:read("*l")
    offset = 35
    while line do
        print_text(cr, line, 20, "left", 20, 190 + offset, 1, 1, 1, 1, "normal")
        line = file:read("*l")
        offset = offset + 20
    end
    file:close()
end

function conky_personal(cr)
    cairo_translate(cr, 0, 500)

    -- mail
    draw_hexagon(cr, 2, 70, 0, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 40, 100, 30, 1, 1, 1, 1)
    local file = io.open("/home/max/.mailcount")
    text = file:read("*n")
    file:close()
    print_text(cr, text, 30, "center", 100, 70, 1, 1, 1, 1, "normal")

    -- tasks
    draw_hexagon(cr, 1, 130, 0, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 40, 190, -20, 1, 1, 1, 1)
    local file = io.popen("task count status:PENDING")
    text = file:read("*n")
    file:close()
    print_text(cr, text, 30, "center", 190, 25, 1, 1, 1, 1, "normal")

    -- news
    draw_hexagon(cr, 2, 250, 0, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 40, 280, 30, 1, 1, 1, 1)
    local file = io.open("/home/max/.newscount")
    text = file:read("*n")
    file:close()
    print_text(cr, text, 30, "center", 280, 70, 1, 1, 1, 1, "normal")
end

function conky_laptop(cr)
    cairo_translate(cr, 0, 325)

    -- brightness
    draw_hexagon(cr, 6, 70, 60, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 60, 100, 10, 1, 1, 1, 1)

    brightness = tonumber(conky_parse("${exec xbacklight -get}"))
    fill_hexagon(cr, 4, 70, 60, 40, brightness, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 4, 70, 60, 40, 0.7, 0.7, 0.7, 1)

    -- battery
    draw_hexagon(cr, 1, 130, 60, 60, 0.7, 0.7, 0.7, 1)
    local file = io.open("/sys/class/power_supply/AC/online")
    ac = file:read("*n")
    file:close()
    icon = (ac == 1 and "" or "")
    print_icon(cr, icon, 60, 190, 60, 1, 1, 1, 1)

    bat0_perc = tonumber(conky_parse("${battery_percent BAT0}"))
    fill_hexagon(cr, 4, 160, 112, 40, bat0_perc, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 4, 160, 112, 40, 0.7, 0.7, 0.7, 1)

    bat1_perc = tonumber(conky_parse("${battery_percent BAT1}"))
    fill_hexagon(cr, 1, 220, 112, 40, bat1_perc, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 1, 220, 112, 40, 0.7, 0.7, 0.7, 1)

    -- volume
    draw_hexagon(cr, 6, 250, 60, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 60, 280, 10, 1, 1, 1, 1)

    volume = tonumber(conky_parse(
                          "${exec pactl list sinks | grep Volume | grep -o '[0-9]*%' | head -1 | sed 's/%//'}"))
    fill_hexagon(cr, 1, 310, 60, 40, volume, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 1, 310, 60, 40, 0.7, 0.7, 0.7, 1)
end

function conky_music(cr)
    cairo_translate(cr, -200, 300)

    cover = "/tmp/conky.cover.png"

    local image = cairo_image_surface_create_from_png(cover)
    w = cairo_image_surface_get_width(image)
    h = cairo_image_surface_get_height(image)

    pattern = cairo_pattern_create_for_surface(image)

    local matrix = cairo_matrix_t:create()
    tolua.takeownership(matrix)

    cairo_matrix_init_scale(matrix, w / 256, h / 256)
    cairo_matrix_translate(matrix, -320, 0)
    cairo_pattern_set_matrix(pattern, matrix)
    cairo_set_source(cr, pattern)

    origin_x, origin_y = 448, 128
    edge = 114
    local height = math.sqrt(3) * edge / 2
    cairo_move_to(cr, origin_x - edge, origin_y)
    cairo_line_to(cr, origin_x - edge / 2, origin_y - height)
    cairo_line_to(cr, origin_x + edge / 2, origin_y - height)
    cairo_line_to(cr, origin_x + edge, origin_y)
    cairo_line_to(cr, origin_x + edge / 2, origin_y + height)
    cairo_line_to(cr, origin_x - edge / 2, origin_y + height)
    cairo_line_to(cr, origin_x - edge, origin_y)
    cairo_fill(cr)

    draw_hexagon(cr, 0, origin_x, origin_y, edge, 0.7, 0.7, 0.7, 1)
    annotate_hexagon(cr, 6, origin_x, origin_y, edge, 15, 0.7, 0.7, 0.7, 1)

    local file = io.open('/home/max/.playerctl_status')
    artist = file:read("*l")
    title = file:read("*l")
    file:close()
    print_text(cr, artist, 20, "left", 20, 240, 1, 1, 1, 1, "normal")
    print_text(cr, title, 20, "left", 20, 270, 1, 1, 1, 1, "normal")

    cairo_pattern_destroy(pattern)
    cairo_surface_destroy(image)
end

function conky_networking(cr)
    cairo_translate(cr, 0, 0)

    net = conky_parse(
              "${if_up enp0s31f6}enp0s31f6${else}${if_up wlp3s0}wlp3s0${endif}${endif}")
    draw_hexagon(cr, 0, 90, 170, 60, 0.7, 0.7, 0.7, 1)
    if net == '' then
        net_icon = ""
    elseif net == 'enp0s31f6' then
        net_icon = ""
        upload = conky_parse("${upspeed " .. net .. "}")
        download = conky_parse("${downspeed " .. net .. "}")
    elseif net == 'wlp3s0' then
        net_icon = ""
        upload = conky_parse("${upspeed " .. net .. "}")
        download = conky_parse("${downspeed " .. net .. "}")
        wifi_qual = tonumber(conky_parse(
                                 "${wireless_link_qual_perc " .. net .. "}"))
        fill_hexagon(cr, 2, 60, 222, 40, wifi_qual, 0.35, 0.35, 0.35, 1)
        draw_hexagon(cr, 2, 60, 222, 40, 0.7, 0.7, 0.7, 1)
        draw_hexagon(cr, 1, 100, 290, 20, 0.7, 0.7, 0.7, 1)
        print_icon(cr, "", 18, 120, 290, 0.7, 0.7, 0.7, 1)
    end
    print_icon(cr, net_icon, 50, 90, 170, 1, 1, 1, 1)

    draw_hexagon(cr, 6, 150, 170, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 40, 180, 100, 1, 1, 1, 1)
    print_text(cr, upload, 24, "center", 180, 140, 1, 1, 1, 1, "normal")

    draw_hexagon(cr, 2, 150, 170, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 40, 180, 205, 1, 1, 1, 1)
    print_text(cr, download, 24, "center", 180, 245, 1, 1, 1, 1, "normal")

    vpn_icon = conky_parse("${if_existing /proc/net/route tun0}${endif}")
    if vpn_icon ~= '' then
        draw_hexagon(cr, 6, 60, 118, 40, 0.7, 0.7, 0.7, 1)
        print_icon(cr, vpn_icon, 40, 80, 80, 0, 1, 0, 1)
    end
end

function conky_storage(cr)
    cairo_translate(cr, 0, 450)

    -- root usage
    draw_hexagon(cr, 5, 120, 90, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 40, 90, 35, 1, 1, 1, 1)
    root_perc = tonumber(conky_parse("${fs_used_perc /}"))
    fill_hexagon(cr, 1, 120, -15, 40, root_perc, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 1, 120, -15, 40, 0.7, 0.7, 0.7, 1)

    -- ram
    draw_hexagon(cr, 1, 120, 90, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 40, 180, 90, 1, 1, 1, 1)
    mem_perc = tonumber(conky_parse("${memperc}"))
    fill_hexagon(cr, 6, 240, 90, 40, mem_perc, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 6, 240, 90, 40, 0.7, 0.7, 0.7, 1)
    swap_perc = tonumber(conky_parse("${swapperc}"))
    fill_hexagon(cr, 2, 240, 90, 40, swap_perc, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 2, 240, 90, 40, 0.7, 0.7, 0.7, 1)

    -- home perc
    draw_hexagon(cr, 3, 120, 90, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 40, 90, 140, 1, 1, 1, 1)
    home_perc = tonumber(conky_parse("${fs_used_perc /home/}"))
    fill_hexagon(cr, 1, 120, 195, 40, home_perc, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 1, 120, 195, 40, 0.7, 0.7, 0.7, 1)
end

function conky_gpu(cr)
    cairo_translate(cr, 0, 500)

    draw_hexagon(cr, 0, 110, 0, 80, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 70, 110, 0, 1, 1, 1, 1)

    gpu_util = tonumber(conky_parse("${nvidia gpuutil 1}"))
    fill_hexagon(cr, 6, 190, 0, 40, gpu_util, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 6, 190, 0, 40, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 1, 230, -70, 20, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 18, 250, -70, 0.7, 0.7, 0.7, 1)

    gpu_memutil = tonumber(conky_parse("${nvidia memutil 1}"))
    fill_hexagon(cr, 2, 190, 0, 40, gpu_memutil, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 2, 190, 0, 40, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 1, 230, 70, 20, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 18, 250, 70, 0.7, 0.7, 0.7, 1)

    gpu_temp = tonumber(conky_parse("${nvidia temp 1}"))
    fill_hexagon(cr, 5, 150, -70, 40, gpu_temp, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 5, 150, -70, 40, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 4, 110, -140, 20, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 18, 90, -140, 0.7, 0.7, 0.7, 1)
end

function conky_cpu(cr)
    cairo_translate(cr, 0, 450)

    cpu_origin_x, cpu_origin_y = 110, -80
    cpu_edge = 90
    cpu_height = math.sqrt(3) * cpu_edge / 2

    cpu_corner_3_x, cpu_corner_3_y = cpu_origin_x + cpu_edge / 2,
                                     cpu_origin_y - cpu_height
    cpu_corner_4_x, cpu_corner_4_y = cpu_origin_x + cpu_edge, cpu_origin_y

    draw_hexagon(cr, 0, cpu_origin_x, cpu_origin_y, cpu_edge, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 80, cpu_origin_x, cpu_origin_y, 1, 1, 1, 1)

    cpu_temp = tonumber(conky_parse("${hwmon 2 temp 1 0.001}"))
    fill_hexagon(cr, 6, cpu_origin_x - cpu_edge / 2, cpu_origin_y - cpu_height,
                 30, cpu_temp, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 6, cpu_origin_x - cpu_edge / 2, cpu_origin_y - cpu_height,
                 30, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 4, cpu_origin_x - cpu_edge / 2,
                 cpu_origin_y - cpu_height - 52, 20, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", 18, 45, -210, 0.7, 0.7, 0.7, 1)

    cairo_select_font_face(cr, "MesloLGS Nerd Font Mono",
                           CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
    cairo_set_font_size(cr, 20)

    thread_edge = 30
    thread_height = math.sqrt(3) * thread_edge / 2

    cpu_perc_1 = tonumber(conky_parse("${cpu cpu1}"))
    fill_hexagon(cr, 5, cpu_corner_3_x, cpu_corner_3_y, thread_edge, cpu_perc_1,
                 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 5, cpu_corner_3_x, cpu_corner_3_y, thread_edge, 0.7, 0.7,
                 0.7, 1)

    cpu_perc_2 = tonumber(conky_parse("${cpu cpu2}"))
    fill_hexagon(cr, 6, cpu_corner_3_x + thread_edge / 2,
                 cpu_corner_3_y - thread_height, thread_edge, cpu_perc_2, 0.35,
                 0.35, 0.35, 1)
    draw_hexagon(cr, 6, cpu_corner_3_x + thread_edge / 2,
                 cpu_corner_3_y - thread_height, thread_edge, 0.7, 0.7, 0.7, 1)

    cpu_perc_3 = tonumber(conky_parse("${cpu cpu3}"))
    fill_hexagon(cr, 1, cpu_corner_3_x, cpu_corner_3_y, thread_edge, cpu_perc_3,
                 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 1, cpu_corner_3_x, cpu_corner_3_y, thread_edge, 0.7, 0.7,
                 0.7, 1)

    cpu_perc_4 = tonumber(conky_parse("${cpu cpu4}"))
    fill_hexagon(cr, 6, cpu_corner_3_x + 2 * thread_edge, cpu_corner_3_y,
                 thread_edge, cpu_perc_4, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 6, cpu_corner_3_x + 2 * thread_edge, cpu_corner_3_y,
                 thread_edge, 0.7, 0.7, 0.7, 1)

    cpu_perc_5 = tonumber(conky_parse("${cpu cpu5}"))
    fill_hexagon(cr, 6, cpu_corner_4_x, cpu_corner_4_y, thread_edge, cpu_perc_5,
                 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 6, cpu_corner_4_x, cpu_corner_4_y, thread_edge, 0.7, 0.7,
                 0.7, 1)

    cpu_perc_6 = tonumber(conky_parse("${cpu cpu6}"))
    fill_hexagon(cr, 1, cpu_corner_4_x + thread_edge,
                 cpu_corner_4_y - 2 * thread_height, thread_edge, cpu_perc_6,
                 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 1, cpu_corner_4_x + thread_edge,
                 cpu_corner_4_y - 2 * thread_height, thread_edge, 0.7, 0.7, 0.7,
                 1)

    cpu_perc_7 = tonumber(conky_parse("${cpu cpu7}"))
    fill_hexagon(cr, 2, cpu_corner_4_x, cpu_corner_4_y, thread_edge, cpu_perc_7,
                 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 2, cpu_corner_4_x, cpu_corner_4_y, thread_edge, 0.7, 0.7,
                 0.7, 1)

    cpu_perc_8 = tonumber(conky_parse("${cpu cpu8}"))
    fill_hexagon(cr, 1, cpu_corner_4_x + thread_edge, cpu_corner_4_y,
                 thread_edge, cpu_perc_8, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 1, cpu_corner_4_x + thread_edge, cpu_corner_4_y,
                 thread_edge, 0.7, 0.7, 0.7, 1)
end

function conky_main_left()
    if conky_window == nil then return end
    local cs = cairo_xlib_surface_create(conky_window.display,
                                         conky_window.drawable,
                                         conky_window.visual,
                                         conky_window.width, conky_window.height)
    cr = cairo_create(cs)
    local updates = tonumber(conky_parse('${updates}'))
    if updates > 1 then
        cairo_set_line_width(cr, 4)
        cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND);

        conky_networking(cr)

        conky_storage(cr)

        conky_gpu(cr)

        conky_cpu(cr)
    end
    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr = nil
end

function conky_main_right()
    if conky_window == nil then return end
    local cs = cairo_xlib_surface_create(conky_window.display,
                                         conky_window.drawable,
                                         conky_window.visual,
                                         conky_window.width, conky_window.height)
    cr = cairo_create(cs)
    local updates = tonumber(conky_parse('${updates}'))
    if updates > 1 then
        cairo_select_font_face(cr, "MesloLGS Nerd Font Mono",
                               CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
        cairo_set_font_size(cr, 20)

        cairo_set_line_width(cr, 4)
        cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND);

        conky_time(cr)

        conky_personal(cr)

        conky_laptop(cr)

        conky_music(cr)
    end
    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr = nil
end
