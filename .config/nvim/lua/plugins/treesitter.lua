return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					'lua',
					'python',
					'javascript',
					'typescript',
					'vimdoc',
					'vim',
					'regex',
					'sql',
					'dockerfile',
					'toml',
					'json',
					'go',
					'gitignore',
					'yaml',
					'make',
					'cmake',
					'markdown',
					'markdown_inline',
					'bash',
					'tsx',
					'css',
					'html',
				},
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<Enter>", -- set to `false` to disable one of the mappings
						node_incremental = "<Enter>",
						scope_incremental = false,
						node_decremental = "<Backspace>",
					},
				},			indent = { enable = true },  
			})
		end
	}
}
