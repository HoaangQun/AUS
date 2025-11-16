-- ~/.config/nvim/lua/config/runner.lua

local M = {}

function M.build_and_run()
  local file = vim.fn.expand("%:p")             -- đường dẫn file .cpp
  local exe = vim.fn.expand("%:p:r") .. ".out"  -- file .out

  local compile_cmd = string.format("g++ -std=c++17 -O2 %s -o %s", file, exe)
  local run_cmd = compile_cmd .. " && " .. exe

  local term = require("toggleterm.terminal").Terminal
  local cpp_runner = term:new({
    cmd = run_cmd,
    direction = "float",
    close_on_exit = false,
    hidden = true
  })
  cpp_runner:toggle()
end

return M

