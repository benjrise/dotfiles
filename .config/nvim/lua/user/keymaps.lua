local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap 

-- Old vim function for find and replace of visual mode including special chars
vim.cmd(
[[
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction
]]
)
vim.cmd(
[[
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction
]]
)

vim.cmd(
[[
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
]]
)

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts) -- caused conflict with WhichKey
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("i", "jj", "<esc>", {noremap = true})
keymap("i", "<C-w>", "<esc>:bw<CR>", opts)
keymap("n", "<C-w>", ":bw<CR>", opts)
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)
-- keymap("n", "<C-u>", "<C-r>", opts)

keymap("n", "<C-A-j>", ":split<CR>", opts)
keymap("n", "<C-A-l>", ":vsplit<CR>", opts)

-- Unmappings 
keymap("n", "<C-z>", "<nop>", opts)

-- Replace highlighted text
keymap ("v", "<S-r>", "y:%s/<C-r>=GetVisual()<cr>//g<left><left>", {noremap = true})
keymap ("v", "<C-r>", "y:s/<C-r>=GetVisual()<cr>//g<left><left>", {noremap = true})
keymap ("v", "<A-r>", ":s///g<left><left><left>", {noremap = true})
keymap("x", "@", ":<C-u>call ExecuteMacroOverVisualRange()<CR>", {noremap = true})
-- Auto add current word to search bar, but don't move immediatly to next match
-- Mostly to use in conjugction with cgn
keymap("n", "*", "*N", {noremap = true})

-- Change undo to be and redo to be same key
keymap ("n", "<C-u>", "<C-r>", opts) 
keymap ("v", "<C-u>", "<C-r>", opts) 

-- Surround
keymap("v", 's', 'S', {noremap = true})

-- Command mode
keymap("c", "<tab>", "<C-j>", opts) 
keymap("c", "<s-tab>", "<C-k>", opts) 

-- Spell checker
-- vim.keymap.set("i", "<S-n>", function()
--   require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({
--       previewer = false,
--       layout_config = {
--         width = 50,
--         height = 15,
--       }
--     })
--   )
--  end, opts)
--
--
-- remove highlights
keymap("n", "<CR>", ":noh<CR>", opts)
-- combine previous line with current line
keymap("n", "<S-u>", "<S-j>", opts)
-- from cursor move rest of text to line below
-- keymap("n", "<C-A-j>", "i<CR><Esc>", opts)
-- -- from cursor move rest of text to line aboce

-- keymap("n", "<C-A-k>", "DO<Esc>p", opts)


-- save file 
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("v", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-s>s", ":wq<CR>", opts)
keymap("v", "<C-s>s", ":wq<CR>", opts)
keymap("i", "<C-s>", "<esc>:w<CR>i<right>", opts)


-- Comment in gnome-terminal (here / is represented by _)
-- vim.keymap.set('n', "<C-_>", "gcc", { remap = true})
-- vim.keymap.set("v", "<C-_>", "gc", { remap = true})

-- Comment in kitty (here / is represented by _)
vim.keymap.set('n', "<C-/>", "gcc", { remap = true})
vim.keymap.set("v", "<C-/>", "gc", { remap = true})


-- Open help on word
keymap("n", "<S-m>", ':execute "help " . expand("<cword>")<cr>', opts)
keymap("n", "<CR>", ":noh<CR>", opts)


-- Fix 'Y', 'D'
keymap("n", "Y", "y$", opts)
keymap("n", "D", "d$", opts)
-- keymap("n", "E", "ge", opts)
keymap("v", "Y", "y$", opts)
keymap("v", "D", "d$", opts)
-- keymap("v", "E", "ge", opts)


-- Avoid cutting text pasted over
keymap("v", "p", '"_dP', opts)


-- Center cursor
keymap("n", "m", "zz", opts)
keymap("v", "m", "zz", opts)


-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)
-- keymap("n", "<A-h>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<A-l>", ":vertical resize +2<CR>", opts)


-- Navigate buffers
keymap("n", "<BS>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)


-- Drag lines
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("v", "<A-j>", ":m'>+<CR>gv", opts)
keymap("v", "<A-k>", ":m-2<CR>gv", opts)


-- Horizontal line movments --
keymap("v", "<S-h>", "g^", opts)
keymap("v", "<S-l>", "g$", opts)
keymap("n", "<S-h>", "g^", opts)
keymap("n", "<S-l>", "g$", opts)

-- Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", "<", "<S-v><<esc>", opts)
keymap("n", ">", "<S-v>><esc>", opts)

-- Navigate display lines
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("v", "j", "gj", opts)
keymap("v", "k", "gk", opts)
keymap("n", "J", "<C-d>zz", opts)
keymap("n", "K", "<C-u>zz", opts)
keymap("v", "J", "<C-d>zz", opts)
keymap("v", "K", "<C-u>zz", opts)

-- Telescope
vim.keymap.set("i", "<A-s>", function()
 require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({
    previewer = false,
     layout_config = {
       width = 50,
       height = 15,
     }
   })
 )
end, opts)
vim.keymap.set("n", "<A-s>", function()
 require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({
    previewer = false,
     layout_config = {
       width = 50,
       height = 15,
     }
   })
 )
end, opts)

-- Find project files
vim.keymap.set("n", "<C-p>", function ()
  require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = false})
  )
end, { remap = true })

keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)

local add_mod_date = function ()
 local fname = vim.fn.expand("%") 
 -- local cmd = "mod-date-util " .. fname
 -- local cmd = ":! mod-date-util " 
 local cmd = ":! echo " 
 cmd = cmd .. "%:p" 
 return cmd
end
--
keymap("n", "<leader>m", add_mod_date(), {noremap=true})

