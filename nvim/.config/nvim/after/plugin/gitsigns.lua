require('gitsigns').setup {
    numhl = true,
    current_line_blame = true,
    current_line_blame_formatter_opts = {
        abbrev_sha = true,
    },
    current_line_blame_formatter = function(name, blame_info, opts)
        if blame_info.author == name then
            blame_info.author = 'You'
        end

        local text
        if blame_info.author == 'Not Committed Yet' then
            text = blame_info.author
        else
            local date_time

            date_time = os.date('%Y-%m-%d', tonumber(blame_info['author_time']))

            local abbrev_sha
            if opts.abbrev_sha then
                abbrev_sha = blame_info.abbrev_sha
            end

            text = string.format('%s, %s - %s @ %s', blame_info.author, date_time, blame_info.summary, abbrev_sha)
        end

        return {{' '..text, 'GitSignsCurrentLineBlame'}}
    end,
    sign_priority = 5,
    word_diff = false,
}
