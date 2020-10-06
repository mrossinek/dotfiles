lua << EOF
local snippets = require'snippets'
local U = require'snippets.utils'

snippets.use_suggested_mappings()

snippets.snippets = {
    _global = {
        note = [[NOTE(${1=io.popen("id -un"):read"*l"}): ]];
        todo = [[TODO(${1=io.popen("id -un"):read"*l"}): ]];
        fixme = [[FIXME(${1=io.popen("id -un"):read"*l"}): ]];
    };
    markdown = {
        ["code"] = "```\n$0\n```";
    };
    pandoc = {
        ["eq"] = "\\begin{equation}\n    $0\n\\end{equation}";
        ["code"] = "```\n$0\n```";
        -- TODO figure out if we can get the below to work somehow
        -- ["link"] = [[[${=require('notes.telescope')['link_note']()}]($0)]];
        -- TODO once the above works, copy it to markdown
    };
    plaintex = {
        ["env"] = "\\begin{${1}}\n    $0\n\\end{${1}}";
    };
}
EOF
