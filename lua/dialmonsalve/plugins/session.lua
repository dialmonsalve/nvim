return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")
		local wk = require("which-key")
		wk.add({
			{ "<leader>.", group = "session" },
			{
				-- restore last workspace session for current directory
				"<leader>.r",
				"<cmd>SessionRestore<CR>",
				desc = "Restore session for cwd",
				mode = "n",
			},
			{
				"<leader>.s",
				"<cmd>SessionSave<CR>",
				desc = "Save session for auto session root dir",
				mode = "n",
			},
		}, {})

		auto_session.setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})
		--
		-- local keymap = vim.keymap
		--
		-- keymap.set(
		-- 	"n",
		-- 	"<leader>w&r",
		-- 	"<cmd>SessionRestore<CR>",
		-- 	{ desc = "Restore session for cwd", silent = false, expr = true }
		-- ) -- restore last workspace session for current directory
		-- keymap.set("n", "<leader>w&s", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
	end,
}
