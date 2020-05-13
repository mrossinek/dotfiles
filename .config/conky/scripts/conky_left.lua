require 'cairo'

conky_start = 1

function conky_networking(cr)
    cairo_translate(cr, 0, 0)

    net = conky_parse(
              "${if_up enp0s31f6}enp0s31f6${else}${if_up wlp3s0}wlp3s0${endif}${endif}")
    draw_hexagon(cr, 0, 90, 170, 60, 4, 0.7, 0.7, 0.7, 1)
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
        fill_hexagon(cr, 2, 60, 222, 40, 4, wifi_qual, "%",
                     "MesloLGS Nerd Font Mono", "normal", 20, 0.35, 0.35, 0.35,
                     1)
        draw_hexagon(cr, 2, 60, 222, 40, 4, 0.7, 0.7, 0.7, 1)
        draw_hexagon(cr, 1, 100, 290, 20, 4, 0.7, 0.7, 0.7, 1)
        print_icon(cr, "", "Font Awesome 5 Free", "bold", 18, 120, 290, 0.7,
                   0.7, 0.7, 1)
    end
    print_icon(cr, net_icon, "Font Awesome 5 Free", "bold", 50, 90, 170, 1, 1,
               1, 1)

    draw_hexagon(cr, 6, 150, 170, 60, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 40, 180, 100, 1, 1, 1,
               1)
    print_text(cr, upload, "MesloLGS Nerd Font Mono", "normal", 24, "center",
               180, 140, 1, 1, 1, 1)

    draw_hexagon(cr, 2, 150, 170, 60, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 40, 180, 205, 1, 1, 1,
               1)
    print_text(cr, download, "MesloLGS Nerd Font Mono", "normal", 24, "center",
               180, 245, 1, 1, 1, 1)

    vpn_icon = conky_parse("${if_existing /proc/net/route tun0}${endif}")
    if vpn_icon ~= '' then
        draw_hexagon(cr, 6, 60, 118, 40, 4, 0.7, 0.7, 0.7, 1)
        print_icon(cr, vpn_icon, "Font Awesome 5 Free", "bold", 40, 80, 80, 0,
                   1, 0, 1)
    end
end

function conky_storage(cr)
    cairo_translate(cr, 0, 450)

    -- root usage
    draw_hexagon(cr, 5, 120, 90, 60, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 40, 90, 35, 1, 1, 1, 1)
    root_perc = tonumber(conky_parse("${fs_used_perc /}"))
    fill_hexagon(cr, 1, 120, -15, 40, 4, root_perc, "%",
                 "MesloLGS Nerd Font Mono", "normal", 20, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 1, 120, -15, 40, 4, 0.7, 0.7, 0.7, 1)

    -- ram
    draw_hexagon(cr, 1, 120, 90, 60, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 40, 180, 90, 1, 1, 1, 1)
    mem_perc = tonumber(conky_parse("${memperc}"))
    fill_hexagon(cr, 6, 240, 90, 40, 4, mem_perc, "%",
                 "MesloLGS Nerd Font Mono", "normal", 20, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 6, 240, 90, 40, 4, 0.7, 0.7, 0.7, 1)
    swap_perc = tonumber(conky_parse("${swapperc}"))
    fill_hexagon(cr, 2, 240, 90, 40, 4, swap_perc, "%",
                 "MesloLGS Nerd Font Mono", "normal", 20, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 2, 240, 90, 40, 4, 0.7, 0.7, 0.7, 1)

    -- home perc
    draw_hexagon(cr, 3, 120, 90, 60, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 40, 90, 140, 1, 1, 1, 1)
    home_perc = tonumber(conky_parse("${fs_used_perc /home/}"))
    fill_hexagon(cr, 1, 120, 195, 40, 4, home_perc, "%",
                 "MesloLGS Nerd Font Mono", "normal", 20, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 1, 120, 195, 40, 4, 0.7, 0.7, 0.7, 1)
end

function conky_gpu(cr)
    cairo_translate(cr, 0, 500)

    -- use nvidia logo as icon
    local image = cairo_image_surface_create_from_png(
                      "/usr/share/pixmaps/nvidia-settings.png")
    w = cairo_image_surface_get_width(image)
    h = cairo_image_surface_get_height(image)

    pattern = cairo_pattern_create_for_surface(image)

    local matrix = cairo_matrix_t:create()
    tolua.takeownership(matrix)

    cairo_matrix_init_scale(matrix, w / 128, h / 128)
    cairo_matrix_translate(matrix, -40, 60)
    cairo_pattern_set_matrix(pattern, matrix)
    cairo_set_source(cr, pattern)

    origin_x, origin_y = 110, 0
    edge = 80
    local height = math.sqrt(3) * edge / 2
    cairo_move_to(cr, origin_x - edge, origin_y)
    cairo_line_to(cr, origin_x - edge / 2, origin_y - height)
    cairo_line_to(cr, origin_x + edge / 2, origin_y - height)
    cairo_line_to(cr, origin_x + edge, origin_y)
    cairo_line_to(cr, origin_x + edge / 2, origin_y + height)
    cairo_line_to(cr, origin_x - edge / 2, origin_y + height)
    cairo_line_to(cr, origin_x - edge, origin_y)
    cairo_fill(cr)

    draw_hexagon(cr, 0, origin_x, origin_y, edge, 4, 0.7, 0.7, 0.7, 1)

    cairo_pattern_destroy(pattern)
    cairo_surface_destroy(image)

    gpu_util = tonumber(conky_parse("${nvidia gpuutil 1}"))
    fill_hexagon(cr, 6, 190, 0, 40, 4, gpu_util, "%", "MesloLGS Nerd Font Mono",
                 "normal", 20, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 6, 190, 0, 40, 4, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 1, 230, -70, 20, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 18, 250, -70, 0.7, 0.7,
               0.7, 1)

    gpu_memutil = tonumber(conky_parse("${nvidia memutil 1}"))
    fill_hexagon(cr, 2, 190, 0, 40, 4, gpu_memutil, "%",
                 "MesloLGS Nerd Font Mono", "normal", 20, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 2, 190, 0, 40, 4, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 1, 230, 70, 20, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 18, 250, 70, 0.7, 0.7,
               0.7, 1)

    gpu_temp = tonumber(conky_parse("${nvidia temp 1}"))
    fill_hexagon(cr, 5, 150, -70, 40, 4, gpu_temp, "°C",
                 "MesloLGS Nerd Font Mono", "normal", 20, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 5, 150, -70, 40, 4, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 4, 110, -140, 20, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 18, 90, -140, 0.7, 0.7,
               0.7, 1)
end

function conky_cpu(cr)
    cairo_translate(cr, 0, 450)

    cpu_origin_x, cpu_origin_y = 110, -80
    cpu_edge = 90
    cpu_height = math.sqrt(3) * cpu_edge / 2

    cpu_corner_3_x, cpu_corner_3_y = cpu_origin_x + cpu_edge / 2,
                                     cpu_origin_y - cpu_height
    cpu_corner_4_x, cpu_corner_4_y = cpu_origin_x + cpu_edge, cpu_origin_y

    draw_hexagon(cr, 0, cpu_origin_x, cpu_origin_y, cpu_edge, 4, 0.7, 0.7, 0.7,
                 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 80, cpu_origin_x,
               cpu_origin_y, 1, 1, 1, 1)

    cpu_temp = tonumber(conky_parse("${hwmon 2 temp 1 0.001}"))
    fill_hexagon(cr, 6, cpu_origin_x - cpu_edge / 2, cpu_origin_y - cpu_height,
                 30, 4, cpu_temp, "°C", "MesloLGS Nerd Font Mono", "normal",
                 20, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 6, cpu_origin_x - cpu_edge / 2, cpu_origin_y - cpu_height,
                 30, 4, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 4, cpu_origin_x - cpu_edge / 2,
                 cpu_origin_y - cpu_height - 52, 20, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 18, 45, -210, 0.7, 0.7,
               0.7, 1)

    thread_edge = 30
    thread_height = math.sqrt(3) * thread_edge / 2

    cpu_perc_1 = tonumber(conky_parse("${cpu cpu1}"))
    fill_hexagon(cr, 5, cpu_corner_3_x, cpu_corner_3_y, thread_edge, 4,
                 cpu_perc_1, "%", "MesloLGS Nerd Font Mono", "normal", 20, 0.35,
                 0.35, 0.35, 1)
    draw_hexagon(cr, 5, cpu_corner_3_x, cpu_corner_3_y, thread_edge, 4, 0.7,
                 0.7, 0.7, 1)

    cpu_perc_2 = tonumber(conky_parse("${cpu cpu2}"))
    fill_hexagon(cr, 6, cpu_corner_3_x + thread_edge / 2,
                 cpu_corner_3_y - thread_height, thread_edge, 4, cpu_perc_2,
                 "%", "MesloLGS Nerd Font Mono", "normal", 20, 0.35, 0.35, 0.35,
                 1)
    draw_hexagon(cr, 6, cpu_corner_3_x + thread_edge / 2,
                 cpu_corner_3_y - thread_height, thread_edge, 4, 0.7, 0.7, 0.7,
                 1)

    cpu_perc_3 = tonumber(conky_parse("${cpu cpu3}"))
    fill_hexagon(cr, 1, cpu_corner_3_x, cpu_corner_3_y, thread_edge, 4,
                 cpu_perc_3, "%", "MesloLGS Nerd Font Mono", "normal", 20, 0.35,
                 0.35, 0.35, 1)
    draw_hexagon(cr, 1, cpu_corner_3_x, cpu_corner_3_y, thread_edge, 4, 0.7,
                 0.7, 0.7, 1)

    cpu_perc_4 = tonumber(conky_parse("${cpu cpu4}"))
    fill_hexagon(cr, 6, cpu_corner_3_x + 2 * thread_edge, cpu_corner_3_y,
                 thread_edge, 4, cpu_perc_4, "%", "MesloLGS Nerd Font Mono",
                 "normal", 20, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 6, cpu_corner_3_x + 2 * thread_edge, cpu_corner_3_y,
                 thread_edge, 4, 0.7, 0.7, 0.7, 1)

    cpu_perc_5 = tonumber(conky_parse("${cpu cpu5}"))
    fill_hexagon(cr, 6, cpu_corner_4_x, cpu_corner_4_y, thread_edge, 4,
                 cpu_perc_5, "%", "MesloLGS Nerd Font Mono", "normal", 20, 0.35,
                 0.35, 0.35, 1)
    draw_hexagon(cr, 6, cpu_corner_4_x, cpu_corner_4_y, thread_edge, 4, 0.7,
                 0.7, 0.7, 1)

    cpu_perc_6 = tonumber(conky_parse("${cpu cpu6}"))
    fill_hexagon(cr, 1, cpu_corner_4_x + thread_edge,
                 cpu_corner_4_y - 2 * thread_height, thread_edge, 4, cpu_perc_6,
                 "%", "MesloLGS Nerd Font Mono", "normal", 20, 0.35, 0.35, 0.35,
                 1)
    draw_hexagon(cr, 1, cpu_corner_4_x + thread_edge,
                 cpu_corner_4_y - 2 * thread_height, thread_edge, 4, 0.7, 0.7,
                 0.7, 1)

    cpu_perc_7 = tonumber(conky_parse("${cpu cpu7}"))
    fill_hexagon(cr, 2, cpu_corner_4_x, cpu_corner_4_y, thread_edge, 4,
                 cpu_perc_7, "%", "MesloLGS Nerd Font Mono", "normal", 20, 0.35,
                 0.35, 0.35, 1)
    draw_hexagon(cr, 2, cpu_corner_4_x, cpu_corner_4_y, thread_edge, 4, 0.7,
                 0.7, 0.7, 1)

    cpu_perc_8 = tonumber(conky_parse("${cpu cpu8}"))
    fill_hexagon(cr, 1, cpu_corner_4_x + thread_edge, cpu_corner_4_y,
                 thread_edge, 4, cpu_perc_8, "%", "MesloLGS Nerd Font Mono",
                 "normal", 20, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 1, cpu_corner_4_x + thread_edge, cpu_corner_4_y,
                 thread_edge, 4, 0.7, 0.7, 0.7, 1)
end

function conky_main()
    if conky_window == nil then return end
    local cs = cairo_xlib_surface_create(conky_window.display,
                                         conky_window.drawable,
                                         conky_window.visual,
                                         conky_window.width, conky_window.height)
    cr = cairo_create(cs)
    local updates = tonumber(conky_parse('${updates}'))

    -- interval 400 means:
    --   every 10 minutes with conky interval of 1.5 with power supply connected
    --   every 33.3 minutes with conky interval of 5 in battery mode
    if (updates % 400) == 0 or conky_start == 1 then conky_start = nil end

    if updates > 1 then
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
