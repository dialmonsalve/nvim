return {
  -- ... otros plugins
  {
    "ibhagwan/fzf-lua",
    config = function()
      require("fzf-lua").setup()
    end,
  },
  {
    import = "lazyvim.plugins.extras.editor.fzf",
    enabled = function()
      return LazyVim.pick.want() == "fzf"
    end,
  },
  {
    import = "lazyvim.plugins.extras.editor.telescope",
    enabled = function()
      return LazyVim.pick.want() == "telescope"
    end,
  },
}
