require 'cairo'

function conky_time(cr)
    cairo_translate(cr, 150, 0)

    draw_hexagon(cr, 0, 350, 125, 90, 6, 0.7, 0.7, 0.7, 1)
    print_text(cr, conky_parse("${time %I:%M}"), "MesloLGS Nerd Font Mono",
               "bold", 50, "center", 350, 125, 1, 1, 1, 1)

    annotate_hexagon(cr, 1, 350, 125, 90, 4, 15, 0.7, 0.7, 0.7, 1)
    print_text(cr, conky_parse("${kernel}"), "MesloLGS Nerd Font Mono",
               "normal", 20, "left", 20, 25, 1, 1, 1, 1)
    annotate_hexagon(cr, 2, 350, 125, 90, 4, 15, 0.7, 0.7, 0.7, 1)
    print_text(cr, conky_parse("${uptime_short}"), "MesloLGS Nerd Font Mono",
               "normal", 20, "left", 20, 115, 1, 1, 1, 1)
    annotate_hexagon(cr, 6, 350, 125, 90, 4, 15, 0.7, 0.7, 0.7, 1)
    print_text(cr, conky_parse("${time %a %b %d}"), "MesloLGS Nerd Font Mono",
               "normal", 20, "left", 20, 210, 1, 1, 1, 1)

    local file = io.popen("cal -m | tail -n +2")
    local line = file:read("*l")
    offset = 35
    while line do
        print_text(cr, line, "MesloLGS Nerd Font Mono", "normal", 20, "left",
                   20, 210 + offset, 1, 1, 1, 1)
        line = file:read("*l")
        offset = offset + 20
    end
    file:close()
end

function conky_personal(cr)
    cairo_translate(cr, 50, 500)

    -- mail
    draw_hexagon(cr, 2, 70, 0, 60, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 40, 100, 30, 1, 1, 1, 1)
    local file = io.open("/home/max/.mailcount")
    text = file:read("*n")
    file:close()
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 30, "center", 100,
               70, 1, 1, 1, 1)

    -- tasks
    draw_hexagon(cr, 1, 130, 0, 60, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 40, 190, -20, 1, 1, 1,
               1)
    local file = io.popen("task count status:PENDING")
    text = file:read("*n")
    file:close()
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 30, "center", 190,
               25, 1, 1, 1, 1)

    -- news
    draw_hexagon(cr, 2, 250, 0, 60, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 40, 280, 30, 1, 1, 1, 1)
    local file = io.open("/home/max/.newscount")
    text = file:read("*n")
    file:close()
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 30, "center", 280,
               70, 1, 1, 1, 1)
end

function conky_laptop(cr)
    cairo_translate(cr, 0, 325)

    -- brightness
    brightness = tonumber(conky_parse("${exec xbacklight -get}"))
    fill_hexagon(cr, 4, 70, 60, 40, 2, brightness, "%",
                 "MesloLGS Nerd Font Mono", "normal", 20, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 4, 70, 60, 40, 2, 0.7, 0.7, 0.7, 1)

    draw_hexagon(cr, 6, 70, 60, 60, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 60, 100, 10, 1, 1, 1, 1)

    -- battery
    bat0_perc = tonumber(conky_parse("${battery_percent BAT0}"))
    fill_hexagon(cr, 4, 160, 112, 40, 2, bat0_perc, "%",
                 "MesloLGS Nerd Font Mono", "normal", 20, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 4, 160, 112, 40, 2, 0.7, 0.7, 0.7, 1)

    bat1_perc = tonumber(conky_parse("${battery_percent BAT1}"))
    fill_hexagon(cr, 1, 220, 112, 40, 2, bat1_perc, "%",
                 "MesloLGS Nerd Font Mono", "normal", 20, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 1, 220, 112, 40, 2, 0.7, 0.7, 0.7, 1)

    draw_hexagon(cr, 1, 130, 60, 60, 4, 0.7, 0.7, 0.7, 1)
    local file = io.open("/sys/class/power_supply/AC/online")
    ac = file:read("*n")
    file:close()
    icon = (ac == 1 and "" or "")
    print_icon(cr, icon, "Font Awesome 5 Free", "bold", 60, 190, 60, 1, 1, 1, 1)

    -- volume
    volume = tonumber(conky_parse(
                          "${exec pactl list sinks | grep Volume | grep -o '[0-9]*%' | head -1 | sed 's/%//'}"))
    fill_hexagon(cr, 1, 310, 60, 40, 2, volume, "%", "MesloLGS Nerd Font Mono",
                 "normal", 20, 0.35, 0.35, 0.35, 1)
    draw_hexagon(cr, 1, 310, 60, 40, 2, 0.7, 0.7, 0.7, 1)

    draw_hexagon(cr, 6, 250, 60, 60, 4, 0.7, 0.7, 0.7, 1)
    print_icon(cr, "", "Font Awesome 5 Free", "bold", 60, 280, 10, 1, 1, 1, 1)

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

    draw_hexagon(cr, 0, origin_x, origin_y, edge, 4, 0.7, 0.7, 0.7, 1)
    annotate_hexagon(cr, 6, origin_x, origin_y, edge, 4, 15, 0.7, 0.7, 0.7, 1)

    local file = io.open('/home/max/.playerctl_status')
    artist = file:read("*l")
    title = file:read("*l")
    file:close()
    print_text(cr, artist, "MesloLGS Nerd Font Mono", "normal", 20, "left", 20,
               240, 1, 1, 1, 1)
    print_text(cr, title, "MesloLGS Nerd Font Mono", "normal", 20, "left", 20,
               270, 1, 1, 1, 1)

    cairo_pattern_destroy(pattern)
    cairo_surface_destroy(image)
end

function conky_main()
    if conky_window == nil then return end
    local cs = cairo_xlib_surface_create(conky_window.display,
                                         conky_window.drawable,
                                         conky_window.visual,
                                         conky_window.width, conky_window.height)
    cr = cairo_create(cs)
    local updates = tonumber(conky_parse('${updates}'))

    -- interval 1200 means:
    --   every 30 minutes with conky interval of 1.5 with power supply connected
    --   every 100 minutes with conky interval of 5 in battery mode
    if (updates % 1200) == 0 and updates > 100 then
        online = os.execute("wget -q --spider http://duckduckgo.com")
        local lock = io.open("/home/max/.sync_lock")
        if online and lock == nil then
            -- gracefully unlock password store
            os.execute("alacritty --title 'pass' -e pass unlock")
            -- fetch all new mail
            os.execute("mbsync -a")
            os.execute("bash $HOME/.config/conky/scripts/mail-counter.sh")
            -- fetch news
            os.execute("newsboat -x reload")
            os.execute("bash $HOME/.config/conky/scripts/news-counter.sh")
            -- sync tasks
            os.execute("task sync")
            os.execute("task rc:~/.config/bugwarrior/taskrc sync")
            -- sync contacts and calendar
            os.execute("vdirsyncer sync")
        end
        lock:close()
    end

    if updates > 1 then
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
