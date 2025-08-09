local M = {}
return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
      {
        "<S-C-i>",
        function()
          require("conform").format({
            async = false,
            timeout_ms = 1500,
            lsp_fallback = true,
          })
        end,
        mode = { "n", "v" },
        desc = "Format file or range (in visual mode)",
      },
    },
    init = function()
      -- Install the conform formatter on VeryLazy
      LazyVim.on_very_lazy(function()
        LazyVim.format.register({
          name = "conform.nvim",
          priority = 100,
          primary = true,
          format = function(buf)
            require("conform").format({ bufnr = buf })
          end,
          sources = function(buf)
            local ret = require("conform").list_formatters(buf)
            ---@param v conform.FormatterInfo
            return vim.tbl_map(function(v)
              return v.name
            end, ret)
          end,
        })
      end)
    end,
    opts = function()
      local plugin = require("lazy.core.config").plugins["conform.nvim"]
      if plugin.config ~= M.setup then
        LazyVim.error({
          "Don't set `plugin.config` for `conform.nvim`.\n",
          "This will break **LazyVim** formatting.\n",
          "Please refer to the docs at https://www.lazyvim.org/plugins/formatting  ",
        }, { title = "LazyVim" })
      end

      -- Cargar tu configuración personalizada
      local custom_opts = {}
      local success, custom_config = pcall(require, "dial.configs.formating")
      if success then
        custom_opts = custom_config
      else
        -- Configuración por defecto si no existe tu archivo
        custom_opts = {
          default_format_opts = {
            timeout_ms = 3000,
            async = false,
            quiet = false,
            lsp_format = "fallback",
          },
          formatters_by_ft = {
            lua = { "stylua" },
            fish = { "fish_indent" },
            sh = { "shfmt" },
            css = { "prettier" },
            javascript = { "prettier" },
            jsx = { "prettier" },
            tsx = { "prettier" },
            typescript = { "prettier" },
            html = { "prettier" },
          },
          formatters = {
            injected = { options = { ignore_errors = true } },
          },
        }
      end

      return custom_opts
    end,
  },
}
