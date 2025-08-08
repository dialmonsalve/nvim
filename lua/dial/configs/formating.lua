return {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		typescript = { "prettier" },
		php = { "php-cs-fixer" },
	},
	format_on_save = {
		async = false,
		timeout_ms = 1500,
		lsp_fallback = true,
	},
}
