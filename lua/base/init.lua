-- General Configuration
vim.g.lazyvim_check_order = false
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 99
vim.opt.clipboard = "unnamedplus"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo(
			{ { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" }, { "\nPress any key to exit..." } },
			true,
			{}
		)
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local configs = {
	{ import = "lazyvim.lazy" },
	{ import = "dial.plugins" },
	{ import = "dial.themes" },
}

local lazy_opts = {
	checker = {
		enabled = true,
	},
	change_detection = {
		notify = true,
	},
}

require("lazy").setup(configs, lazy_opts)
require("dial.keymaps")
