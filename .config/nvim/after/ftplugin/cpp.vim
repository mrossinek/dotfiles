setlocal foldmethod=syntax

command! MakeTags !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .

let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_NamespaceSearch = 1
let OmniCpp_DefaultNamespace = ["std"]
