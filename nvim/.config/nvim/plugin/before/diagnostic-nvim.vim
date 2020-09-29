let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ''
let g:space_before_virtual_text = 2
call sign_define("LspDiagnosticsErrorSign", {"text" : "", "texthl" : "LspDiagnosticsErrorSign"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "", "texthl" : "LspDiagnosticsWarningSign"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "", "texthl" : "LspDiagnosticsInformationSign"})
call sign_define("LspDiagnosticsHintSign", {"text" : "", "texthl" : "LspDiagnosticsHintSign"})
