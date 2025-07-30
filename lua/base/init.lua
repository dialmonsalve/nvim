-- General Configuration
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 99
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Bootstrap of Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({{"Failed to clone lazy.nvim:\n", "ErrorMsg"}, {out, "WarningMsg"},
                           {"\nPress any key to exit..."}}, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Normal Mappings
vim.keymap.set("n", "<leader>1", vim.cmd.bfirst)
vim.keymap.set("n", "<leader>0", vim.cmd.blast)
vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)
vim.keymap.set("n", "<leader>o", "o<Esc>k")
vim.keymap.set("n", "<leader>x", vim.cmd.bdelete)
vim.keymap.set("n", "<leader>y", '"+yy', {
    noremap = true
})
vim.keymap.set("n", "<leader>dy", "3<cmd>lua vim.diagnostic.open_float()<CR>", {
    noremap = true
})
vim.keymap.set("n", "<leader>fi", "/", {
    noremap = true
})
vim.keymap.set("n", "<leader>a", "ggVG", {
    noremap = true
})
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", {
    noremap = true,
    silent = true
})

-- Hover to NvimTree and back to buffer
vim.keymap.set("n", "<C-l>", function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
        if bufname:match("NvimTree_") then
            vim.api.nvim_set_current_win(win)
            return
        end
    end
end, {
    desc = "Hover to nvim-tree"
})

vim.keymap.set("n", "<C-h>", function()
    vim.cmd("wincmd p")
end, {
    desc = "back to editor"
})

-- Configurations
-- require("configs.cmp")
require("configs.mappings")

local lazy_opts = {
    checker = {
        enabled = true
    },
    change_detection = {
        notify = true
    }
}
require("lazy").setup({{
    import = "plugins"
}, {
    import = "themes"
} 
}, lazy_opts)

require("lazy").setup(configs, lazy_opts)

