require("dial.keymaps.nvimtree")
require("dial.keymaps.normal")

vim.keymap.set("n", "<leader>b", vim.cmd.DapToggleBreakpoint)
vim.keymap.set("n", "<leader>ds", vim.cmd.DapSidebar)

local discipline = require("dial.functions.discipline")
discipline.cowboy()
