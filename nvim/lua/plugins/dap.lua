return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("nvim-dap-virtual-text").setup()
    dapui.setup()

    -- Open/close UI automatically
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    -- Adapter cho C/C++ dùng gdb
    dap.adapters.cpp = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap" }
    }
    dap.adapters.c = dap.adapters.cpp

    -- Config mặc định cho C/C++
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cpp",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp

    -- Keymaps tiện dụng
    vim.keymap.set('n', '/db', dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set('n', '/c', dap.continue, { desc = "Continue" })
    vim.keymap.set('n', '/i', dap.step_into, { desc = "Step Into" })
    vim.keymap.set('n', '/o', dap.step_over, { desc = "Step Over" })
    vim.keymap.set('n', '/O', dap.step_out, { desc = "Step Out" })
    vim.keymap.set('n', '/r', dap.repl.open, { desc = "Open REPL" })
    vim.keymap.set('n', '/l', dap.run_last, { desc = "Run Last" })
  end,
}

