shared = {
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
}

md = {
 
--     s({trig="me", dscr=""},
--     fmta(
--         [[
--           $$
--           <>
--           $$
--         ]],
--         { i(1) }
--     )
--     ),


}
