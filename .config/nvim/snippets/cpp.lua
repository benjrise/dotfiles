local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {

   s({trig="std", snippetType="autosnippet", dscr=""},
      t("std::")
   ),

   s({trig="cout", snippetType="autosnippet", dscr=""},
      fmta(
      [[
      cout <<<< <> <<<< "\n"; 
      ]],
   { i(1) }
   )
   ),

   s({trig="if", snippetType="autosnippet", dscr=""},
      fmta(
      [[
      if (<>) {
         <>
      }
      ]],
      { i(1), i(2) }
   )
   ),

   s({trig="while", snippetType="autosnippet", dscr=""},
      fmta(
      [[
      while (<>) {
         <>
      }
      ]],
   { i(1), i(2) }
   )
   ),

}
