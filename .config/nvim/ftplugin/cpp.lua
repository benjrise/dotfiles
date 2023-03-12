local fname = vim.api.nvim_buf_get_name(0)
local build_file = ":!g++ " .. fname .. "<CR>"

if packer_plugins["which-key.nvim"] and packer_plugins["which-key.nvim"].loaded then
	local wk = require("which-key")
	local opts = {
		prefix = "",
		buffer = 0, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = false, 
		noremap = true, 
		nowait = false,
	}

	local mappings = {
    ["<localleader>b"] = { build            , "build" },
	}

	wk.register(mappings, opts)
end
