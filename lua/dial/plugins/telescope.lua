return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      return require("dial.configs.telescope")
    end,
    -- function(_,opts)
    --	    require("telescope").setup(opts)
    --  end
  },
}
