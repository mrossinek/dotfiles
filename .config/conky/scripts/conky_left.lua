require 'cairo'

conky_start = 1

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
        print_icon(cr, "", "Font Awesome 5 Free", "bold", 18, 120, 290, 0.7, 0.7, 0.7, 1)
    end
    print_icon(cr, net_icon, "Font Awesome 5 Free", "bold", 50, 90, 170, 1, 1, 1, 1)

    draw_hexagon(cr, 6, 150, 170, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 40, 180, 100, 1, 1, 1, 1)
    print_text(cr, upload, "MesloLGS Nerd Font Mono", "normal", 24, "center", 180, 140, 1, 1, 1, 1)

    draw_hexagon(cr, 2, 150, 170, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 40, 180, 205, 1, 1, 1, 1)
    print_text(cr, download, "MesloLGS Nerd Font Mono", "normal", 24, "center", 180, 245, 1, 1, 1, 1)

    vpn_icon = conky_parse("${if_existing /proc/net/route tun0}${endif}")
    if vpn_icon ~= '' then
        draw_hexagon(cr, 6, 60, 118, 40, 0.7, 0.7, 0.7, 1)
        print_icon(cr, vpn_icon, "Font Awesome 5 Free", "bold", 40, 80, 80, 0, 1, 0, 1)
    end
end

function conky_storage(cr)
    cairo_translate(cr, 0, 450)

    -- root usage
    draw_hexagon(cr, 5, 120, 90, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 40, 90, 35, 1, 1, 1, 1)
    root_perc = tonumber(conky_parse("${fs_used_perc /}"))
    fill_hexagon(cr, 1, 120, -15, 40, root_perc, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 1, 120, -15, 40, 0.7, 0.7, 0.7, 1)

    -- ram
    draw_hexagon(cr, 1, 120, 90, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 40, 180, 90, 1, 1, 1, 1)
    mem_perc = tonumber(conky_parse("${memperc}"))
    fill_hexagon(cr, 6, 240, 90, 40, mem_perc, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 6, 240, 90, 40, 0.7, 0.7, 0.7, 1)
    swap_perc = tonumber(conky_parse("${swapperc}"))
    fill_hexagon(cr, 2, 240, 90, 40, swap_perc, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 2, 240, 90, 40, 0.7, 0.7, 0.7, 1)

    -- home perc
    draw_hexagon(cr, 3, 120, 90, 60, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 40, 90, 140, 1, 1, 1, 1)
    home_perc = tonumber(conky_parse("${fs_used_perc /home/}"))
    fill_hexagon(cr, 1, 120, 195, 40, home_perc, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 1, 120, 195, 40, 0.7, 0.7, 0.7, 1)
end

function conky_gpu(cr)
    cairo_translate(cr, 0, 500)

    draw_hexagon(cr, 0, 110, 0, 80, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 70, 110, 0, 1, 1, 1, 1)

    gpu_util = tonumber(conky_parse("${nvidia gpuutil 1}"))
    fill_hexagon(cr, 6, 190, 0, 40, gpu_util, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 6, 190, 0, 40, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 1, 230, -70, 20, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 18, 250, -70, 0.7, 0.7, 0.7, 1)

    gpu_memutil = tonumber(conky_parse("${nvidia memutil 1}"))
    fill_hexagon(cr, 2, 190, 0, 40, gpu_memutil, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 2, 190, 0, 40, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 1, 230, 70, 20, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 18, 250, 70, 0.7, 0.7, 0.7, 1)

    gpu_temp = tonumber(conky_parse("${nvidia temp 1}"))
    fill_hexagon(cr, 5, 150, -70, 40, gpu_temp, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 5, 150, -70, 40, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 4, 110, -140, 20, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 18, 90, -140, 0.7, 0.7, 0.7, 1)
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
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 80, cpu_origin_x, cpu_origin_y, 1, 1, 1, 1)

    cpu_temp = tonumber(conky_parse("${hwmon 2 temp 1 0.001}"))
    fill_hexagon(cr, 6, cpu_origin_x - cpu_edge / 2, cpu_origin_y - cpu_height,
                 30, cpu_temp, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 6, cpu_origin_x - cpu_edge / 2, cpu_origin_y - cpu_height,
                 30, 0.7, 0.7, 0.7, 1)
    draw_hexagon(cr, 4, cpu_origin_x - cpu_edge / 2,
                 cpu_origin_y - cpu_height - 52, 20, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 18, 45, -210, 0.7, 0.7, 0.7, 1)

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

function conky_main()
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
