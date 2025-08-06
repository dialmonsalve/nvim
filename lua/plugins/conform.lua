return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    return require("configs.formating")
  end,
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)

    -- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    vim.keymap.set({ "n", "v" }, "<S-C-i>", function()
      conform.format({
        async = false,
        timeout_ms = 1500,
        lsp_fallback = true,
      })
    end, {
      desc = "Format file or range (in visual mode)",
    })
  end,
}
