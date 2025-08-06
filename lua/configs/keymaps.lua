require("configs.keymaps.nvimtree")
require("configs.keymaps.normal")

vim.keymap.set("n", "<leader>b", vim.cmd.DapToggleBreakpoint)
--vim.keymap.set("n", "<S-C>i", vim.cmd.DapSidebar)
vim.keymap.set("n", "<leader>ds", vim.cmd.DapSidebar)

local discipline = require("functions.discipline")
discipline.cowboy()
