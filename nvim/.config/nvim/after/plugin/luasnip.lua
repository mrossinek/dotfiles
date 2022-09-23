local luasnip = require('luasnip')
local snip = luasnip.snippet
local s = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local events = require("luasnip.util.events")

if not luasnip.snippets then
    luasnip.snippets = {}
end

luasnip.add_snippets("all", {
    snip("FIXME", {
        t("FIXME("),
        p(os.getenv, "USER"),
        t("): "),
    }),
    snip("NOTE", {
        t("NOTE("),
        p(os.getenv, "USER"),
        t("): "),
    }),
    snip("TODO", {
        t("TODO("),
        p(os.getenv, "USER"),
        t("): "),
    }),
})

luasnip.add_snippets("python", {
    snip("PROPERTY", {
        t({"@property", "def "}),
        i(1),
        t("(self) -> "),
        i(2),
        t({":", '\t"""Returns the '}),
        r(1),
        t({'."""', "\treturn self._"}),
        r(1),
        t({"", "", "@"}),
        r(1),
        t({".setter", "def "}),
        r(1),
        t("(self, "),
        r(1),
        t(": "),
        r(2),
        t({") -> None:", '\t"""Sets the '}),
        r(1),
        t({'."""', "\tself._"}),
        r(1),
        t(" = "),
        r(1),
        t({"", ""}),
    }),
})

luasnip.add_snippets("tex", {
    snip("ENVIRONMENT", {
        t("\\begin{"),
        i(1),
        t({"}", "\t"}),
        i(0),
        t({"", "\\end{"}),
        r(1),
        t("}"),
    }),
})

-- TODO: figure out how to make this usable!
-- PERF: currently startup performance is horrible, because account_choices gets
-- evaluated at startup rather than once its needed
--
-- local function account_choices()
--     local choices = {t("ACCOUNT")}
--     local handle = io.popen("hledger accounts")
--     for line in handle:lines() do
--         table.insert(choices, t(line))
--     end
--     handle:close()
--     return choices
-- end
--
-- local function negate(args, _, _)
--     return string.format("%.2f", -1 * tonumber(args[1][1]))
-- end
--
-- luasnip.add_snippets("ledger", {
--     snip("TRANSACTION", {
--         i(1),
--         t("/"),
--         i(2),
--         t(" "),
--         i(3),
--         t({"", "\t"}),
--         c(4, account_choices()),
--         t("  CHF "),
--         i(5, "0.00"),
--         t({"", "\t"}),
--         c(6, account_choices()),
--         t("  CHF "),
--         f(negate, 5, {}),
--         t({"", ""}),
--         i(0),
--     }, {
--         callbacks = {
--             [0] = {
--                 [events.enter] = function (node, _)
--                     local from_pos, _ = node.mark:pos_begin_end_raw()
--                     local buf_line = from_pos[1]
--                     vim.api.nvim_cmd(
--                         {
--                             cmd="call",
--                             args={"ledger#align_commodity()"},
--                             range={buf_line-1, buf_line},
--                         },
--                         {}
--                     )
--                 end
--             },
--         },
--     }),
-- })
--
-- vim.keymap.set("i", "<C-Space>", "<cmd>lua require('luasnip.extras.select_choice')()<cr>", { remap = false })
