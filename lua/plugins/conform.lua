return {{
    "stevearc/conform.nvim",
    event = {"BufReadPre", "BufNewFile"},
    opts = function()
        return require("configs.formating")
    end,
    config = function(_, opts)
        require("conform").setup(opts)
    end
}}
