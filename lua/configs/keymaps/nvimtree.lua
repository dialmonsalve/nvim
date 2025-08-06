local map = vim.keymap

map.set("n", "<leader>e", vim.cmd.NvimTreeFocus)
map.set("n", "<C-n>", vim.cmd.NvimTreeToggle)

map.set("n", "<C-h>", function()
  vim.cmd("wincmd p")
end, {
  desc = "back to editor",
})
