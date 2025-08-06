local map = vim.keymap

--local config = function(mode, keymap, fn)
-- return vim.keymap.set(mode, keymap, fn)
--end

vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

--config("n", "<leader>1", vim.cmd.bfirst)
map.set("n", "<leader>1", vim.cmd.bfirst)
map.set("n", "<leader>0", vim.cmd.blast)
map.set("n", "<Tab>", vim.cmd.bnext)
map.set("n", "<S-Tab>", vim.cmd.bprevious)
map.set("n", "<leader>o", "o<Esc>k")
map.set("n", "<leader>x", vim.cmd.bdelete)
map.set("n", "<leader>y", '"+yy', { noremap = true })
map.set("n", "<leader>dy", "3<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true })
map.set("n", "<leader>fi", "/", { noremap = true })
map.set("n", "<leader>a", "ggVG", { noremap = true })

map.set({ "n", "i", "v", "x", "s" }, "<C-s>", function()
  local success, err = pcall(function()
    vim.cmd("write")
    vim.notify("File is saved", vim.log.levels.INFO, { title = "Saved" })
  end)

  if not success then
    vim.notify("Error on save: " .. tostring(err), vim.log.levels.ERROR, { title = "Error" })
  end
end, {
  desc = "Save file at any mode",
  silent = true,
})
