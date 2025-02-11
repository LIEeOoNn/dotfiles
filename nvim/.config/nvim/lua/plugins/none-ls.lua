return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			-- declare all the formater, linter and
			-- completions we want to have
			-- install using :Mason
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.completion.spell,
				--require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
			},
		})

		vim.keymap.set("n", "F", vim.lsp.buf.format, { desc = "Format file" })
	end,
}
