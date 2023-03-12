require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})
require("luasnip").config.set_config({ -- Setting LuaSnip config
   history = false,
   -- Enable autotriggered snippets
   enable_autosnippets = true,

   -- Use Tab (or some other key if you prefer) to trigger visual selection
   store_selection_keys = "<Tab>",
   region_check_events = 'InsertEnter',
   delete_check_events = 'InsertLeave'
})


-- Tab defined in cmp.lua
vim.cmd[[
" Use ll to jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" imap <silent><expr> <Tab> '<Plug>luasnip-jump-next' 
" smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug> <Plug>luasnip-jump-next' : <Nop>
smap <silent><expr> <C-l> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : <Nop>
" Use hh to jump backwards through snippets
imap <silent><expr> <C-h> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev': <Nop>
smap <silent><expr> <C-h> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : <Nop>
]]

-- local luasnip = require("luasnip")
-- tests = function(fallback)
--  if luasnip.expand_or_jumpable() then
--    luasnip.expand_or_jump()
--  else
--    fallback()
--  end
-- end






