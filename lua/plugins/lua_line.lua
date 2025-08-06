return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      return require("configs.lualine")
    end,
    config = function(_, opts)
      require("confings.lualine").setup(opts)
    end,
  },
}
