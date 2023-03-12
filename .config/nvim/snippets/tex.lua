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

rec_table = function ()
  return sn(nil, {
    c(1, {
      t({""}),
      sn(nil, {t{"\\\\",""} ,d(1,table_node, {ai[1]}), d(2, rec_table, {ai[1]})})
    }),
  });
end

table_node= function(args)
	local tabs = {}
	local count
	table = args[1][1]:gsub("%s",""):gsub("|","")
	count = table:len()
	for j=1, count do
		local iNode
		iNode = i(j)
		tabs[2*j-1] = iNode
		if j~=count then
			tabs[2*j] = t" & "
		end
	end
	return sn(nil, tabs)
end

-- local shared_maps = require("snippets.shared-tex-md")
-- local tex_maps = {
--     s({trig="tt", dscr="Expands 'tt' into '\texttt{}'"},
--       {
--         t("\\texttt{"),
--         i(1),
--         t("}"),
--       }
--     ),
-- }
--
-- -- 
-- for k,v in pairs(shared_maps) do table.insert(tex_maps, v) end
--
-- return tex_maps
-- return shared_maps
--
-- return
--   {
--       -- =====================================================================
--  
--       s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'", snippetType="autosnippet", wordTrig=true},
--         {
--           t("\\frac{"),
--           i(1),  
--           t("}{"),
--           i(2),  
--           t("}")
--         }
--       ),
--  
--       s({trig="mm", snippetType="autosnippet", wordTrig=True},
--         {
--           t("$"),
--           i(1),
--           t("$")
--         }
--       ),
--       
--       s({trig="me", dscr=""},
--       fmta(
--           [[
--             $$
--             <>
--             $$
--           ]],
--           { i(1) }
--       )
--       ),
--       s({trig="uu", snippetType="autosnippet", dscr=""},
--       fmta(
--           [[
--               {<>}_{<>}
--           ]],
--           { i(1), i(2) }
--       )
--       ),
--  
--       s({trig="rr", snippetType="autosnippet", dscr=""},
--       fmta(
--           [[
--               (<>)
--           ]],
--           { i(1) }
--       )
--       ),
--  
--       s({trig="ss", snippetType="autosnippet", dscr=""},
--       fmta(
--           [[
--               [<>]
--           ]],
--           { i(1) }
--       )
--       ),
--  
--       s({trig="pp", snippetType="autosnippet", dscr="", wordTrig=True},
--       fmta(
--           [[
--               {<>}^{<>}
--           ]],
--           { i(1), i(2, "2") }
--       )
--       ),
--       
--       s({trig="pu", snippetType="autosnippet", dscr="", wordTrig=True},
--       fmta(
--         [[
--           {<>}_{<>}^{<>}
--           ]],
--           { i(1), i(2), i(3, "2") }
--         )
--       ),
--       
--       s({trig="tt", snippetType="autosnippet", wordTrig=True},
--       {
--         t("\\times"),
--       }
--     ),
--  
--       s({trig="mc"},
--       fmta(
--           "\\mathcal{<>}",
--           { i(1) }
--       )
--       ),
--  
--       s({trig="mb"},
--       fmta(
--           "\\mathbf{<>}",
--           { i(1) }
--       )
--       ),
--  
--       s({trig="bb"},
--       fmta(
--           "\\mathbb{<>}",
--           { i(1) }
--       )
--       ),
--  
--       s({trig="tl"},
--       fmta(
--           "\\tilde{<>}",
--           { i(1) }
--       )
--       ),
--  
--       s({trig="opn", snippetType="autosnippet", desc="[OP]erator[N]ame"},
--       fmta(
--           "\\operatorname{<>}",
--           { i(1) }
--       )
--       ),
--  
--       s({trig="bs", snippetType="autosnippet", desc="[OP]erator[N]ame"},
--       fmta(
--           "\\boldsymbol{<>}",
--           { i(1) }
--       )
--       ),
--  
--  
--  
--       -- =====================================================================
--  
--  
--       s({trig="sum"},
--       fmta(
--           [[
--               \sum^{<>}_{<>}
--           ]],
--           { i(1), i(2) }
--       )
--       ),
--  
--       s({trig="am", snippetType="autosnippet"},
--         {
--           t("\\operatorname{arg} \\operatorname{max}"),
--         }
--       ),
--  
--  
--  
--  
--       s({trig="eq", dscr=""},
--       fmta(
--           [[
--           \begin{equation}
--               <>
--           \end{equation}
--           ]],
--           { i(0) }
--       )
--       ),
--       
--       s({trig="eq", dscr=""},
--       fmta(
--           [[
--           \begin{equation}
--               <>
--           \end{equation}
--           ]],
--           { i(0) }
--       )
--       ),
--  
--       s({trig="lrb", snippetType="autosnippet", dscr="left right bracket"},
--       fmta(
--           [[
--             \left( <> \right)
--           ]],
--           { i(0) }
--       )
--       ),
--  
--       s({trig="lrp", snippetType="autosnippet", dscr="left right pipe"},
--       fmta(
--           [[
--             \left| <> \right|
--           ]],
--           { i(0) }
--       )
--       ),
--  
--       s({trig="lrs", snippetType="autosnippet", dscr="left right square bracket"},
--       fmta(
--           [[
--             \left[ <> \right]
--           ]],
--           { i(0) }
--       )
--       ),
--  
--       s({trig="lrc", snippetType="autosnippet", dscr="left right curly braces"},
--       fmta(
--           [[
--             \left{ <> \right}
--           ]],
--           { i(0) }
--       )
--       ),
--  
--       s({trig="bal", dscr=""},
--       fmta(
--           [[
--           \begin{align}
--               <>
--           \end{align}
--           ]],
--           { i(0) }
--       )
--       ),
--  
--       s({trig="und", dscr="[UND]erbrace"},
--       fmta(
--           [[
--           \underbrace {<>}_{<>}
--           ]],
--           { i(1), i(2)}
--       )
--       ),
--  
--       s({trig="fig"},
--       fmta(
--           [[
--           \begin{figure}
--           \centering
--           \includegraphics[width=\textwidth]{<>}
--           \caption{<>}
--           \label{fig:<>}
--           \end{figure}
--           ]],
--           { i(1), i(2), i(3) }
--           )
--       ),
--  
--       s("table", {
--         t"\\begin{tabular}{",
--         i(1,"0"),
--         t{"}",""},
--         d(2, table_node, {1}, {}),
--         d(3, rec_table, {1}),
--         t{"","\\end{tabular}"}
--       }),
--   }
--  
--   local maps = {
--       s({trig="mm", snippetType="autosnippet", wordTrig=True},
--         {
--           t("$"),
--           i(1),
--           t("$")
--         }
--       ),
--   }
--   return maps
 
  -- return {
  --     s({trig="mm", snippetType="autosnippet", wordTrig=True},
  --       {
  --         t("$"),
  --         i(1),
  --         t("$")
  --       }
  --     )
  -- }

  return 
  {
      -- =====================================================================
      s({trig="tt", dscr="Expands 'tt' into '\texttt{}'"},
        {
          t("\\texttt{"),
          i(1),
          t("}"),
        }
      ),
 
      s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'", snippetType="autosnippet", wordTrig=true},
        {
          t("\\frac{"),
          i(1),  
          t("}{"),
          i(2),  
          t("}")
        }
      ),
 
      s({trig="mm", snippetType="autosnippet", wordTrig=True},
        {
          t("$"),
          i(1),
          t("$")
        }
      ),
      
      s({trig="me", dscr=""},
      fmta(
          [[
            $$
            <>
            $$
          ]],
          { i(1) }
      )
      ),
      s({trig="uu", snippetType="autosnippet", dscr=""},
      fmta(
          [[
              {<>}_{<>}
          ]],
          { i(1), i(2) }
      )
      ),
 
      s({trig="rr", snippetType="autosnippet", dscr=""},
      fmta(
          [[
              (<>)
          ]],
          { i(1) }
      )
      ),
 
      s({trig="ss", snippetType="autosnippet", dscr=""},
      fmta(
          [[
              [<>]
          ]],
          { i(1) }
      )
      ),
 
      s({trig="pp", snippetType="autosnippet", dscr="", wordTrig=True},
      fmta(
          [[
              {<>}^{<>}
          ]],
          { i(1), i(2, "2") }
      )
      ),
      
      s({trig="pu", snippetType="autosnippet", dscr="", wordTrig=True},
      fmta(
        [[
          {<>}_{<>}^{<>}
          ]],
          { i(1), i(2), i(3, "2") }
        )
      ),
      
      s({trig="tt", snippetType="autosnippet", wordTrig=True},
      {
        t("\\times"),
      }
    ),
 
      s({trig="mc"},
      fmta(
          "\\mathcal{<>}",
          { i(1) }
      )
      ),
 
      s({trig="mb"},
      fmta(
          "\\mathbf{<>}",
          { i(1) }
      )
      ),
 
      s({trig="bb"},
      fmta(
          "\\mathbb{<>}",
          { i(1) }
      )
      ),
 
      s({trig="tl"},
      fmta(
          "\\tilde{<>}",
          { i(1) }
      )
      ),
 
      s({trig="opn", snippetType="autosnippet", desc="[OP]erator[N]ame"},
      fmta(
          "\\operatorname{<>}",
          { i(1) }
      )
      ),
 
      s({trig="bs", snippetType="autosnippet", desc="[OP]erator[N]ame"},
      fmta(
          "\\boldsymbol{<>}",
          { i(1) }
      )
      ),
 
 
 
      -- =====================================================================
 
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
 
      s({trig=";c", snippetType="autosnippet"},
        {
          t("\\chi"),
        }
      ),
 
      -- =====================================================================
 
      
 
      s({trig="sum"},
      fmta(
          [[
              \sum^{<>}_{<>}
          ]],
          { i(1), i(2) }
      )
      ),
 
      s({trig="am", snippetType="autosnippet"},
        {
          t("\\operatorname{arg} \\operatorname{max}"),
        }
      ),
 
 
 
 
      s({trig="eq", dscr=""},
      fmta(
          [[
          \begin{equation}
              <>
          \end{equation}
          ]],
          { i(0) }
      )
      ),
      
      s({trig="eq", dscr=""},
      fmta(
          [[
          \begin{equation}
              <>
          \end{equation}
          ]],
          { i(0) }
      )
      ),
 
      s({trig="lrb", snippetType="autosnippet", dscr="left right bracket"},
      fmta(
          [[
            \left( <> \right)
          ]],
          { i(0) }
      )
      ),
 
      s({trig="lrp", snippetType="autosnippet", dscr="left right pipe"},
      fmta(
          [[
            \left| <> \right|
          ]],
          { i(0) }
      )
      ),
 
      s({trig="lrs", snippetType="autosnippet", dscr="left right square bracket"},
      fmta(
          [[
            \left[ <> \right]
          ]],
          { i(0) }
      )
      ),
 
      s({trig="lrc", snippetType="autosnippet", dscr="left right curly braces"},
      fmta(
          [[
            \left{ <> \right}
          ]],
          { i(0) }
      )
      ),
 
      s({trig="bal", dscr=""},
      fmta(
          [[
          \begin{align}
              <>
          \end{align}
          ]],
          { i(0) }
      )
      ),
 
      s({trig="und", dscr="[UND]erbrace"},
      fmta(
          [[
          \underbrace {<>}_{<>}
          ]],
          { i(1), i(2)}
      )
      ),
 
      s({trig="fig"},
      fmta(
          [[
          \begin{figure}
          \centering
          \includegraphics[width=\textwidth]{<>}
          \caption{<>}
          \label{fig:<>}
          \end{figure}
          ]],
          { i(1), i(2), i(3) }
          )
      ),
 
      s("table", {
        t"\\begin{tabular}{",
        i(1,"0"),
        t{"}",""},
        d(2, table_node, {1}, {}),
        d(3, rec_table, {1}),
        t{"","\\end{tabular}"}
      }),
 }

-- return maps
