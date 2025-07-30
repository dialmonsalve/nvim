return {
    formatters_by_ft = {
        lua = {"stylua"},
        python = {"isort", "black"}
    },
    format_on_save = {
        async = false,
        timeout_ms = 1500,
        lsp_fallback = true
    },

    vim.keymap.set({"n", "v"}, "<leader>mp", function()
        conform.format({
            async = false,
            timeout_ms = 1500,
            lsp_fallback = true
        })
    end, {
        desc = "Format file or range (in visual mode)"
    })
}
