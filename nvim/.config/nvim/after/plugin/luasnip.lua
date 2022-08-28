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

