function conky_format( format, string )
        return string.format( format, conky_parse( string ))
end
