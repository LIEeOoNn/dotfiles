return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
      "williamboman/mason.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      require("mason-null-ls").setup({
        ensure_installed = {
          "stylua",
          "black",
          "ruff",
        },
        automatic_installation = true,
      })

      null_ls.setup({
        sources = {
          -- lua stuff 
          null_ls.builtins.formatting.stylua,
          -- python stuff 
          null_ls.builtins.formatting.black,
          -- null_ls.builtins.diagnostics.ruff,
          -- generall 
          null_ls.builtins.completion.spell,
        },
      })

      vim.keymap.set("n", "F", vim.lsp.buf.format, { desc = "Format file" })
    end,
  },
}
