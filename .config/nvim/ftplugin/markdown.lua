require("user.ftutils.shared-md-tex")

if packer_plugins["which-key.nvim"] and packer_plugins["which-key.nvim"].loaded then
	local wk = require("which-key")
	local opts = {
		prefix = "",
		buffer = 0, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, 
		noremap = true, 
		nowait = false,
	}

	local mappings = {
    ["<localleader>b"] = { "<cmd>MarkdownPreviewToggle<CR>"            , "markdown preview" },
	}

	wk.register(mappings, opts)
end

