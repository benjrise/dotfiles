
local colorscheme = "tokyonight"

if colorcheme == "tokyonight" then 
   require("tokyonight").setup({
     style = "storm",
     -- transparent = true,
    -- sidebars = { "qf", "vista_kind", "terminal", "packer" },
    -- darkSidebar = true,
    -- darkFloat = true,
     styles = {
       comments = {italic = true},
       keywords = {italic = false},
     },
   })
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
   vim.notify("colorscheme " .. colorscheme .. " not found!")
   return
end


