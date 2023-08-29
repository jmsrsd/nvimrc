local use = function(server)
	return require("plugins.config.lspconfig.config." .. server)
end

local util = require("keymaps.util")
local bind = util.bind

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
		{ "j-hui/fidget.nvim" },
		{ "rcarriga/nvim-notify" },
	},
	config = function()
		local lspconfig = require("lspconfig")

		-- npm install -g @astrojs/language-server
		--
		lspconfig.astro.setup({})

		-- npm i -g vscode-langservers-extracted
		--
		lspconfig.cssls.setup({})

		-- npm install -g cssmodules-language-server
		--
		lspconfig.cssmodules_ls.setup({})

		-- npm i -g vscode-langservers-extracted
		--
		lspconfig.eslint.setup({})
		lspconfig.jsonls.setup({})

		-- brew install lua-language-server
		--
		lspconfig.lua_ls.setup(use("lua_ls"))

		-- npm install -g @tailwindcss/language-server
		--
		lspconfig.tailwindcss.setup({})

		-- npm install -g typescript typescript-language-server
		--
		lspconfig.tsserver.setup({})

		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		--

		bind({
			mode = { "n" },
			lhs = "[d",
			rhs = vim.diagnostic.open_float,
			opts = {
				noremap = true,
			},
		})

		bind({
			mode = { "n" },
			lhs = "]d",
			rhs = vim.diagnostic.setloclist,
			opts = {
				noremap = true,
			},
		})

		bind({
			mode = { "n" },
			lhs = "[g",
			rhs = vim.diagnostic.goto_prev,
			opts = {
				noremap = true,
			},
		})

		bind({
			mode = { "n" },
			lhs = "]g",
			rhs = vim.diagnostic.goto_next,
			opts = {
				noremap = true,
			},
		})

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		--
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local telescope = require("telescope.builtin")

				-- Enable completion triggered by <c-x><c-o>
				--
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				--
				local opts = { buffer = ev.buf }

				bind({
					mode = { "n" },
					lhs = "gD",
					rhs = vim.lsp.buf.declaration,
					opts = opts,
				})

				bind({
					mode = "n",
					lhs = "gd",
					rhs = telescope.lsp_definitions,
					-- rhs = vim.lsp.buf.definition,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "K",
					rhs = vim.lsp.buf.hover,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "gi",
					rhs = telescope.lsp_implementations,
					-- rhs = vim.lsp.buf.implementation,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "gh",
					rhs = vim.lsp.buf.signature_help,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "<leader>wa",
					rhs = vim.lsp.buf.add_workspace_folder,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "<leader>wr",
					rhs = vim.lsp.buf.remove_workspace_folder,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "<space>wl",
					rhs = function()
						vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()), vim.log.levels.INFO)
						-- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "gt",
					rhs = telescope.lsp_type_definitions,
					-- rhs = vim.lsp.buf.type_definition,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "<leader>re",
					rhs = vim.lsp.buf.rename,
					opts = opts,
				})

				bind({
					mode = { "n", "v" },
					lhs = "<leader>aa",
					rhs = vim.lsp.buf.code_action,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "<leader>rr",
					rhs = telescope.lsp_references,
					-- rhs = vim.lsp.buf.references,
					opts = opts,
				})

				bind({
					mode = { "n" },
					lhs = "<leader>fi",
					rhs = function()
						vim.lsp.buf.format({ async = false })
					end,
					opts = opts,
				})
			end,
		})
	end,
}
