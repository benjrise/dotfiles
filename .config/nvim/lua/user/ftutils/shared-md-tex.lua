-- Share these command for only md and tex
local opts = {
   -- buffer = true, -- Global mappings. Specify a buffer number for buffer local mappings
   silent = true, 
   noremap = true, 
}

vim.cmd([[setlocal wrap]])
vim.cmd([[setlocal spell]])

-- On creation of buffer with md or tex set these keymaps
local buf_keymap = vim.api.nvim_buf_set_keymap
-- Undo after space rather than change from insert mode, much more useful when writing
buf_keymap(0, "i", "<space>", "<space><C-g>u", opts) 

