setlocal foldmethod=syntax

command! MakeTags AsyncRun ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .

let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_NamespaceSearch = 1
let OmniCpp_DefaultNamespace = ["std"]

set shiftwidth=4
