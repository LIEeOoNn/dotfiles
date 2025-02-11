return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- add language servers here
					"lua_ls",
					"clangd",
					--"basedpyright",
					--"rust_analyzer",
					--"gopls",
					--"texlab"
				},
			})
		end,
	},
	{ -- https://github.com/neovim/nvim-lspconfig
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			-- declare lsp in the following way again
			lspconfig.lua_ls.setup({capabilities = capabilities})
			lspconfig.clangd.setup({capabilities = capabilities})
			--lspconfig.basedpyright.setup({})

			--  This function gets run when an LSP connects to a particular buffer.
			--local on_attach = function(_, bufnr)

			-- Helper func which lets us more easily define mappings specific
			-- for LSP related items.
			-- sets the mode, buffer and description for us each time.
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end
				vim.keymap.set("n", keys, func, {
					buffer = bufnr,
					desc = desc,
				})
			end
			-- KEYMAPPING
			-- Diagnostic keymaps
			nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
			nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
			nmap("<leader>e", vim.diagnostic.open_float, "Open floating diagnostic message")
			nmap("<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")
			nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

			nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
			nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
			nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
			nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
			nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

			-- See `:help K` for why this keymap
			nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

			-- Lesser used LSP functionality
			nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
			nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
			nmap("<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, "[W]orkspace [L]ist Folders")
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
}
