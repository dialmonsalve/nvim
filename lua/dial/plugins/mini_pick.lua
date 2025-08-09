return {
  -- ... otros plugins
  {
    "echasnovski/mini.pick",
    config = function()
      require("mini.pick").setup()
    end,
  },
}
