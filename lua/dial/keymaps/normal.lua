local map = LazyVim.safe_keymap_set

--local config = function(mode, keymap, fn)
-- return vim.keymap.set(mode, keymap, fn)
--end

map("n", "<space>d", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<space>q", vim.diagnostic.setloclist)

--config("n", "<leader>1", vim.cmd.bfirst)
map("n", "<leader>1", vim.cmd.bfirst)
map("n", "<leader>0", vim.cmd.blast)
map("n", "<Tab>", vim.cmd.bnext)
map("n", "<S-Tab>", vim.cmd.bprevious)
map("n", "<leader>o", "o<Esc>k")
map("n", "<leader>x", vim.cmd.bdelete)
map("n", "<leader>y", '"+yy', { noremap = true })
map("n", "<leader>dy", "3<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true })
map("n", "<leader>fi", "/", { noremap = true })
map("n", "<leader>a", "ggVG", { noremap = true })

map({ "n", "i", "v", "x", "s" }, "<C-s>", function()
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
