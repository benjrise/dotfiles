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

local shared_maps = 
{
    s({trig=";p", snippetType="autosnippet"},
     {
        t("\\pi"),
     } 
    ),

    s({trig=";S", snippetType="autosnippet"},
     {
        t("\\Sigma"),
     } 
    ),
    

    s({trig=";x", snippetType="autosnippet"},
      {
        t("\\boldsymbol{x}"),
      }
    ),

    s({trig=";y", snippetType="autosnippet"},
      {
        t("\\boldsymbol{y}"),
      }
    ),

    s({trig=";z", snippetType="autosnippet"},
      {
        t("\\boldsymbol{z}"),
      }
    ),

    s({trig=";m", snippetType="autosnippet"},
      {
        t("\\mu"),
      }
    ),

    s({trig=";s", snippetType="autosnippet"},
      {
        t("\\sigma"),
      }
    ),

    s({trig=";b", snippetType="autosnippet"},
      {
        t("\\beta"),
      }
    ),

    s({trig=";B", snippetType="autosnippet"},
      {
        t("\\Beta"),
      }
    ),

    s({trig=";g", snippetType="autosnippet"},
      {
        t("\\gamma"),
      }
    ),

    s({trig=";G", snippetType="autosnippet"},
      {
        t("\\Gamma"),
      }
    ),

    s({trig=";e", snippetType="autosnippet"},
      {
        t("\\epsilon"),
      }
    ),

    s({trig=";E", snippetType="autosnippet"},
      {
        t("\\Epsilon"),
      }
    ),

    s({trig=";l", snippetType="autosnippet"},
      {
        t("\\lambda"),
      }
    ),

    s({trig=";L", snippetType="autosnippet"},
      {
        t("\\Lambda"),
      }
    ),

    s({trig=";a", snippetType="autosnippet"},
      {
        t("\\alpha"),
      }
    ),

    s({trig=";A", snippetType="autosnippet"},
      {
        t("\\Alpha"),
      }
    ),

    s({trig=";th", snippetType="autosnippet"},
      {
        t("\\theta"),
      }
    ),
 }

return shared_maps
