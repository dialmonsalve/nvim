-- plugins/lsp.lua
return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstallAll" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      mason_lspconfig.setup({
        ensure_installed = {
          "ts_ls",
          "html",
          "cssls",
          "tailwindcss",
          "lua_ls",
          "emmet_ls",
          "pyright",
          "rust_analyzer",
          "intelephense",
          "astro",
        },
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "isort",
          "black",
          "pylint",
          "eslint_d",
          "phpcs",
        },
      })

      vim.api.nvim_create_user_command("MasonInstallAll", function()
        local servers = {
          "ts_ls",
          "html",
          "cssls",
          "tailwindcss",
          "lua_ls",
          "emmet_ls",
          "pyright",
          "rust_analyzer",
          "intelephense",
          "astro",
        }
        if #servers > 0 then
          vim.cmd("MasonInstall " .. table.concat(servers, " "))
        end
      end, {})

      vim.g.mason_binaries_list = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
        "pyright",
        "rust_analyzer",
        "intelephense",
        "astro",
      }
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("dial.configs.lspconfig")
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
}
