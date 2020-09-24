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
}
EOF
