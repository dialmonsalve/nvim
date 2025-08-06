return {
  {
    "mfussenegger/nvim-dap",
    -- lldb is required for debuggin to work:
    -- vim.keymap.set("n", "<leader>ds", vim.cmd.DapSidebar)
    config = function()
      vim.api.nvim_create_user_command("DapSidebar", function()
        local widgets = require("dap.ui.widgets")
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end, {})
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-python").setup("/home/stan/fast_api_example/fastApiVenv/bin/python3")
      table.insert(require("dap").configurations.python, {
        type = "python",
        request = "launch",
        name = "FastAPI",
        module = "fastapi",
        args = { "dev", "main.py", "--reload", "--host", "0.0.0.0", "--port", "8000" },
        console = "integratedTerminal",
      })
    end,
  },
}
