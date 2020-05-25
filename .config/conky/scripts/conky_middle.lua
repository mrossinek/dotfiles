require 'cairo'

function conky_weather(cr)
    cairo_translate(cr, 0, 0)
    local file = io.open('/home/max/.weather/weather.txt')

    -- current weather
    draw_hexagon(cr, 0, 600, 120, 80, 6, 0.7, 0.7, 0.7, 1)
    current = {}
    line = file:read("*l")
    for str in string.gmatch(line, "([^;]+)") do table.insert(current, str) end
    print_icon(cr, current[2], "Weather Icons", "normal", 50, 600, 90, 1, 1, 1,
               1)
    print_text(cr, current[3] .. "°C", "MesloLGS Nerd Font Mono", "normal", 40,
               "center", 600, 150, 1, 1, 1, 1)

    -- forecast tomorrow
    draw_hexagon(cr, 0, 480, 190, 80, 2, 0.7, 0.7, 0.7, 1)
    tomorrow = {}
    line = file:read("*l")
    for str in string.gmatch(line, "([^;]+)") do table.insert(tomorrow, str) end
    print_text(cr, tomorrow[1], "MesloLGS Nerd Font Mono", "normal", 24,
               "center", 480, 230, 1, 1, 1, 1)
    print_icon(cr, tomorrow[2], "Weather Icons", "normal", 50, 480, 170, 1, 1,
               1, 1)
    draw_hexagon(cr, 5, 400, 190, 40, 1, 0.7, 0.7, 0.7, 1)
    print_text(cr, tomorrow[3] .. "°C", "MesloLGS Nerd Font Mono", "normal",
               24, "center", 380, 155, 1, 1, 1, 1)
    draw_hexagon(cr, 3, 400, 190, 40, 1, 0.7, 0.7, 0.7, 1)
    print_text(cr, tomorrow[4] .. "°C", "MesloLGS Nerd Font Mono", "normal",
               24, "center", 380, 225, 1, 1, 1, 1)

    -- forecast the day after tomorrow
    draw_hexagon(cr, 0, 720, 190, 80, 2, 0.7, 0.7, 0.7, 1)
    after_tomorrow = {}
    line = file:read("*l")
    for str in string.gmatch(line, "([^;]+)") do
        table.insert(after_tomorrow, str)
    end
    print_text(cr, after_tomorrow[1], "MesloLGS Nerd Font Mono", "normal", 24,
               "center", 720, 230, 1, 1, 1, 1)
    print_icon(cr, after_tomorrow[2], "Weather Icons", "normal", 50, 720, 170,
               1, 1, 1, 1)
    draw_hexagon(cr, 6, 800, 190, 40, 1, 0.7, 0.7, 0.7, 1)
    print_text(cr, after_tomorrow[3] .. "°C", "MesloLGS Nerd Font Mono",
               "normal", 24, "center", 820, 155, 1, 1, 1, 1)
    draw_hexagon(cr, 2, 800, 190, 40, 1, 0.7, 0.7, 0.7, 1)
    print_text(cr, after_tomorrow[4] .. "°C", "MesloLGS Nerd Font Mono",
               "normal", 24, "center", 820, 225, 1, 1, 1, 1)

    -- last update
    draw_hexagon(cr, 0, 600, 260, 80, 2, 0.7, 0.7, 0.7, 1)
    update = {}
    line = file:read("*l")
    for str in string.gmatch(line, "([^ ]+)") do table.insert(update, str) end
    print_text(cr, "Update:", "MesloLGS Nerd Font Mono", "normal", 20, "center",
               600, 220, 1, 1, 1, 1)
    print_text(cr, update[2] .. " " .. update[3], "MesloLGS Nerd Font Mono",
               "normal", 20, "center", 600, 260, 1, 1, 1, 1)
    print_text(cr, update[5], "MesloLGS Nerd Font Mono", "normal", 20, "center",
               600, 280, 1, 1, 1, 1)
    print_text(cr, update[6], "MesloLGS Nerd Font Mono", "normal", 20, "center",
               600, 300, 1, 1, 1, 1)

    file:close()
end

function parse_stock(file)
    line = file:read("*l")
    stock = {}
    for str in string.gmatch(line, "([^ ]+)") do table.insert(stock, str) end
    text = ''
    if stock[2] == 'NaN' then
        text = text .. string.format("%6s", stock[2])
    else
        text = text .. string.format("%6.2f", stock[2])
    end
    if stock[3] == 'NaN' then
        text = text .. string.format("%6s", stock[3])
    else
        text = text .. string.format("%+6.2f", stock[3])
    end
    if stock[4] == 'NaN' then
        text = text .. string.format("%6s", stock[4])
    else
        text = text .. string.format("%+6.2f%%", stock[4])
    end
    return stock[1], text
end

function conky_stocks(cr)
    cairo_translate(cr, 0, 1200)
    local file = io.open('/home/max/.stocks/prices.txt')

    draw_hexagon(cr, 0, 50, 10, 40, 4, 0.7, 0.7, 0.7, 1)
    annotate_hexagon(cr, 4, 50, 10, 40, 2, 580, 0.7, 0.7, 0.7, 1)
    stock, text = parse_stock(file)
    print_text(cr, stock:gsub("[^%w].*", ""), "MesloLGS Nerd Font Mono",
               "normal", 20, "center", 50, 10, 1, 1, 1, 1)
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 20, "right", 580,
               0, 1, 1, 1, 1)
    --
    draw_hexagon(cr, 0, 1150, 10, 40, 4, 0.7, 0.7, 0.7, 1)
    annotate_hexagon(cr, 1, 1150, 10, 40, 2, 620, 0.7, 0.7, 0.7, 1)
    stock, text = parse_stock(file)
    print_text(cr, stock:gsub("[^%w].*", ""), "MesloLGS Nerd Font Mono",
               "normal", 20, "center", 1150, 10, 1, 1, 1, 1)
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 20, "left", 620,
               0, 1, 1, 1, 1)
    --
    draw_hexagon(cr, 0, 110, 45, 40, 4, 0.7, 0.7, 0.7, 1)
    annotate_hexagon(cr, 4, 110, 45, 40, 2, 580, 0.7, 0.7, 0.7, 1)
    stock, text = parse_stock(file)
    print_text(cr, stock:gsub("[^%w].*", ""), "MesloLGS Nerd Font Mono",
               "normal", 20, "center", 110, 45, 1, 1, 1, 1)
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 20, "right", 580,
               35, 1, 1, 1, 1)
    --
    draw_hexagon(cr, 0, 1090, 45, 40, 4, 0.7, 0.7, 0.7, 1)
    annotate_hexagon(cr, 1, 1090, 45, 40, 2, 620, 0.7, 0.7, 0.7, 1)
    stock, text = parse_stock(file)
    print_text(cr, stock:gsub("[^%w].*", ""), "MesloLGS Nerd Font Mono",
               "normal", 20, "center", 1090, 45, 1, 1, 1, 1)
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 20, "left", 620,
               35, 1, 1, 1, 1)
    --
    draw_hexagon(cr, 0, 170, 80, 40, 4, 0.7, 0.7, 0.7, 1)
    annotate_hexagon(cr, 4, 170, 80, 40, 2, 580, 0.7, 0.7, 0.7, 1)
    stock, text = parse_stock(file)
    print_text(cr, stock:gsub("[^%w].*", ""), "MesloLGS Nerd Font Mono",
               "normal", 20, "center", 170, 80, 1, 1, 1, 1)
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 20, "right", 580,
               70, 1, 1, 1, 1)
    --
    draw_hexagon(cr, 0, 1030, 80, 40, 4, 0.7, 0.7, 0.7, 1)
    annotate_hexagon(cr, 1, 1030, 80, 40, 2, 620, 0.7, 0.7, 0.7, 1)
    stock, text = parse_stock(file)
    print_text(cr, stock:gsub("[^%w].*", ""), "MesloLGS Nerd Font Mono",
               "normal", 20, "center", 1030, 80, 1, 1, 1, 1)
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 20, "left", 620,
               70, 1, 1, 1, 1)
    --
    draw_hexagon(cr, 0, 230, 115, 40, 4, 0.7, 0.7, 0.7, 1)
    annotate_hexagon(cr, 4, 230, 115, 40, 2, 580, 0.7, 0.7, 0.7, 1)
    stock, text = parse_stock(file)
    print_text(cr, stock:gsub("[^%w].*", ""), "MesloLGS Nerd Font Mono",
               "normal", 20, "center", 230, 115, 1, 1, 1, 1)
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 20, "right", 580,
               105, 1, 1, 1, 1)
    --
    draw_hexagon(cr, 0, 970, 115, 40, 4, 0.7, 0.7, 0.7, 1)
    annotate_hexagon(cr, 1, 970, 115, 40, 2, 620, 0.7, 0.7, 0.7, 1)
    stock, text = parse_stock(file)
    print_text(cr, stock:gsub("[^%w].*", ""), "MesloLGS Nerd Font Mono",
               "normal", 20, "center", 970, 115, 1, 1, 1, 1)
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 20, "left", 620,
               105, 1, 1, 1, 1)
    --
    draw_hexagon(cr, 0, 290, 150, 40, 4, 0.7, 0.7, 0.7, 1)
    annotate_hexagon(cr, 4, 290, 150, 40, 2, 580, 0.7, 0.7, 0.7, 1)
    stock, text = parse_stock(file)
    print_text(cr, stock:gsub("[^%w].*", ""), "MesloLGS Nerd Font Mono",
               "normal", 20, "center", 290, 150, 1, 1, 1, 1)
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 20, "right", 580,
               140, 1, 1, 1, 1)
    --
    draw_hexagon(cr, 0, 910, 150, 40, 4, 0.7, 0.7, 0.7, 1)
    annotate_hexagon(cr, 1, 910, 150, 40, 2, 620, 0.7, 0.7, 0.7, 1)
    stock, text = parse_stock(file)
    print_text(cr, stock:gsub("[^%w].*", ""), "MesloLGS Nerd Font Mono",
               "normal", 20, "center", 910, 150, 1, 1, 1, 1)
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 20, "left", 620,
               140, 1, 1, 1, 1)

    line = file:read("*l")
    print_text(cr, "Update: " .. line, "MesloLGS Nerd Font Mono", "normal", 20,
               "center", 600, 175, 1, 1, 1, 1)

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

    -- interval 1200 means:
    --   every 30 minutes with conky interval of 1.5 with power supply connected
    --   every 100 minutes with conky interval of 5 in battery mode
    if (updates % 1200) == 0 and updates > 100 then
        online = os.execute("wget -q --spider http://duckduckgo.com")
        local lock = io.open("/home/max/.sync_lock")
        if online and lock == nil then
            -- fetch weather forecast
            os.execute("bash $HOME/.weather/weather-watcher.sh")
            -- fetch stock data
            os.execute("python $HOME/.stocks/stock-watcher.py")
        end
        lock:close()
    end

    if updates > 1 then
        cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND);

        conky_weather(cr)

        conky_stocks(cr)
    end
    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr = nil
end
