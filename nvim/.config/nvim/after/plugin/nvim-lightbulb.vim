autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

call sign_define("LightBulbSign", {"text": "💡", "texthl": "SignColumn", "linehl": "", "numhl": ""})
