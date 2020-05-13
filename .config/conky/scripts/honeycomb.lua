require 'cairo'
require 'imlib2'

-- prints an icon in the specified font
function print_icon(cr, icon, font, bold, size, xpos, ypos, red, green, blue, alpha)
    local extents = cairo_text_extents_t:create()
    tolua.takeownership(extents)

    if bold == 'bold' then
        weight = CAIRO_FONT_WEIGHT_BOLD
    else
        weight = CAIRO_FONT_WEIGHT_NORMAL
    end
    cairo_select_font_face(cr, font, CAIRO_FONT_SLANT_NORMAL, weight)
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
function print_text(cr, text, font, bold, size, align, xpos, ypos, red, green, blue, alpha)
    local extents = cairo_text_extents_t:create()
    tolua.takeownership(extents)

    if bold == 'bold' then
        weight = CAIRO_FONT_WEIGHT_BOLD
    else
        weight = CAIRO_FONT_WEIGHT_NORMAL
    end
    cairo_select_font_face(cr, font, CAIRO_FONT_SLANT_NORMAL, weight)
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
    print_text(cr, text, "MesloLGS Nerd Font Mono", "normal", 20, "center", origin_x, origin_y, 1, 1, 1, 1)
end
