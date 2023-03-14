local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
 return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
   return
end

local copilot_status_ok, copilot = pcall(require, "copilot")
if not copilot_status_ok then
   return
end

local check_backspace = function()
   local col = vim.fn.col "." - 1
   return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
   Text = "",
   Method = "m",
   Function = "",
   Constructor = "",
   Field = "",
   Variable = "",
   Class = "",
   Interface = "",
   Module = "",
   Property = "",
   Unit = "",
   Value = "",
   Enum = "",
   Keyword = "",
   Snippet = "",
   Color = "",
   File = "",
   Reference = "",
   Folder = "",
   EnumMember = "",
   Constant = "",
   Struct = "",
   Event = "",
   Operator = "",
   TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet


local base_setup = {
   -- preselect = cmp.PreselectMode.None,
   completion = {
      -- autocomplete = {
      --   cmp.TriggerEvent.TextChanged,
      --   cmp.TriggerEvent.InsertEnter,
      -- },
      completeopt = "menu,menuone,noinsert",
      -- completeopt = "menuone,noinsert,noselect",
      keyword_length = 1,
   },
   snippet = {
      expand = function(args)
         luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
   },
   -- Add {"i", "c" } to work in both command mode and insert mode
   mapping = {
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-e>"] = cmp.mapping {
         i = cmp.mapping.abort(),
         c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(cmp.complete_common_string({ select = false }), {"c"}),

      ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.confirm({ select = true })
         elseif luasnip.expandable() then
            luasnip.expand()
         elseif luasnip.expand_or_jumpable() then
            -- Copilot dismiss
            -- vim.cmd("<Plug>(copilot-dismiss)") 
            luasnip.expand_or_jump()
         elseif check_backspace() then
            fallback()
         else
            fallback()
         end
      end, {
            "i",
            "s",
         }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
         -- if cmp.visible() then
         --   cmp.select_prev_item()
         if luasnip.jumpable(-1) then
            luasnip.jump(-1)
         else
            fallback()
         end
      end, {
            "i",
            "s",
         }),
   },

   -- Formatting the drop down menu
   formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
         -- Kind icons
         vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

         vim_item.menu = ({
            omni = "[VimTex]",
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            spell = "[Spell]",
            latex_symbols = "[Symbols]",
            cmdline = "[CMD]",
            path = "[Path]",
         })[entry.source.name]
         return vim_item
      end,
   },

   -- In order of preference
   sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "omni" },
      { name = "buffer", keyword_length = 3 },
      { name = "spell",
         keyword_length = 5,
         option = {
            keep_all_entries = false,
            enable_in_context = function()
               return true
            end
         },
      },
      { name = "latex_symbols",
         filetype = { "tex", "latex" },
         option = { cache = true }, -- avoids reloading each time
      },
      { name = "path" },
   }),

   confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
   },

   view = {
      entries = 'custom',
   },

   window = {
      documentation = {
         border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      }
   },
}

cmp.setup(base_setup)
-- local no_lsp_sources = cmp.config.sources({
--       { name = "luasnip" },
--       { name = "omni" },
--       { name = "buffer", keyword_length = 3 },
--       { name = "spell",
--          keyword_length = 5,
--          option = {
--             keep_all_entries = false,
--             enable_in_context = function()
--                return true
--             end
--          },
--       },
--       { name = "latex_symbols",
--          filetype = { "tex", "latex" },
--          option = { cache = true }, -- avoids reloading each time
--       },
--       { name = "path" },
--    })
--
--
-- local keymap = vim.api.nvim_set_keymap 
-- keymap("i", "<C-Space>", 
--    function () require("cmp").setup() end, 
-- )

cmp.setup.cmdline('/', {
   sources = {
      {name = 'buffer'}
   }
})
-- -- `:` cmdline setup.

cmp.setup.cmdline(':', {
   completion = {
      keyword_length = 1,
      -- completeopt = "menu,menuone,noinsert",
      completeopt = "menu,noinsert,noselect",

   },
   cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
         { name = 'path' }
      }, {
            {
               name = 'cmdline',
               option = {
                  ignore_cmds = { 'Man', '!' }
               }
            }
         })
   })
})


