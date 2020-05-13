require 'cairo'

function conky_weather(cr)
    local file = io.open('/home/max/.weather/weather.txt')

    -- current weather
    draw_hexagon(cr, 0, 300, 120, 80, 6, 0.7, 0.7, 0.7, 1)
    current = {}
    line = file:read("*l")
    for str in string.gmatch(line, "([^;]+)") do table.insert(current, str) end
    print_icon(cr, current[2], "Weather Icons", "normal", 50, 300, 90, 1, 1, 1,
               1)
    print_text(cr, current[3] .. "°C", "MesloLGS Nerd Font Mono", "normal", 40,
               "center", 300, 150, 1, 1, 1, 1)

    -- forecast tomorrow
    draw_hexagon(cr, 0, 180, 190, 80, 2, 0.7, 0.7, 0.7, 1)
    tomorrow = {}
    line = file:read("*l")
    for str in string.gmatch(line, "([^;]+)") do table.insert(tomorrow, str) end
    print_text(cr, tomorrow[1], "MesloLGS Nerd Font Mono", "normal", 24,
               "center", 180, 230, 1, 1, 1, 1)
    print_icon(cr, tomorrow[2], "Weather Icons", "normal", 50, 180, 170, 1, 1,
               1, 1)
    draw_hexagon(cr, 5, 100, 190, 40, 2, 0.7, 0.7, 0.7, 1)
    print_text(cr, tomorrow[3] .. "°C", "MesloLGS Nerd Font Mono", "normal",
               24, "center", 80, 155, 1, 1, 1, 1)
    draw_hexagon(cr, 3, 100, 190, 40, 2, 0.7, 0.7, 0.7, 1)
    print_text(cr, tomorrow[4] .. "°C", "MesloLGS Nerd Font Mono", "normal",
               24, "center", 80, 225, 1, 1, 1, 1)

    -- forecast the day after tomorrow
    draw_hexagon(cr, 0, 420, 190, 80, 2, 0.7, 0.7, 0.7, 1)
    after_tomorrow = {}
    line = file:read("*l")
    for str in string.gmatch(line, "([^;]+)") do
        table.insert(after_tomorrow, str)
    end
    print_text(cr, after_tomorrow[1], "MesloLGS Nerd Font Mono", "normal", 24,
               "center", 420, 230, 1, 1, 1, 1)
    print_icon(cr, after_tomorrow[2], "Weather Icons", "normal", 50, 420, 170,
               1, 1, 1, 1)
    draw_hexagon(cr, 6, 500, 190, 40, 2, 0.7, 0.7, 0.7, 1)
    print_text(cr, after_tomorrow[3] .. "°C", "MesloLGS Nerd Font Mono",
               "normal", 24, "center", 520, 155, 1, 1, 1, 1)
    draw_hexagon(cr, 2, 500, 190, 40, 2, 0.7, 0.7, 0.7, 1)
    print_text(cr, after_tomorrow[4] .. "°C", "MesloLGS Nerd Font Mono",
               "normal", 24, "center", 520, 225, 1, 1, 1, 1)

    -- last update
    draw_hexagon(cr, 0, 300, 260, 80, 2, 0.7, 0.7, 0.7, 1)
    update = {}
    line = file:read("*l")
    for str in string.gmatch(line, "([^ ]+)") do table.insert(update, str) end
    print_text(cr, "Update", "MesloLGS Nerd Font Mono", "normal", 20, "center",
               300, 220, 1, 1, 1, 1)
    print_text(cr, update[2] .. " " .. update[3], "MesloLGS Nerd Font Mono",
               "normal", 20, "center", 300, 260, 1, 1, 1, 1)
    print_text(cr, update[5], "MesloLGS Nerd Font Mono", "normal", 20, "center",
               300, 280, 1, 1, 1, 1)
    print_text(cr, update[6], "MesloLGS Nerd Font Mono", "normal", 20, "center",
               300, 300, 1, 1, 1, 1)

    file:close()
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
    if (updates % 400) == 0 or conky_start == 1 then
        os.execute("bash $HOME/.weather/weather-watcher.sh")
        conky_start = nil
    end

    if updates > 1 then
        cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND);

        conky_weather(cr)
    end
    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr = nil
end
