
vim.g.copilot_filetypes = {tex = false, markdown = false}
--
vim.g.copilot_no_tab_map = true
vim.cmd
[[
inoremap <silent><expr> kk copilot#Accept("")
inoremap <silent> kj <cmd>Copilot disable<CR>
inoremap <silent> <A-c> <cmd>Copilot disable<CR>
inoremap <silent> <C-c> <cmd>Copilot enable<CR>
]]
-- vim.cmd
-- [[
--    :
-- ]]
-- -- if vim.cmd[[copilot#Status()]] then
-- --   print("Copilot is enabled")
-- --   vim.cmd[[Copilot enable]]
-- -- end
-- print("Copilot is disabled")
