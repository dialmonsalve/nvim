return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = {
            text = "+",
          },
          change = {
            text = "~",
          },
          delete = {
            text = "-",
          },
          topdelete = {
            text = "‾",
          },
          changedelete = {
            text = "~",
          },
        },
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 300,
        },
      })
    end,
  },
}
