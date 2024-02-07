local get_arguments = function()
  local co = coroutine.running()
  if co then
    return coroutine.create(function()
      local args = {}
      vim.ui.input({ prompt = "Args: " }, function(input)
        args = vim.split(input or "", " ")
      end)
      coroutine.resume(co, args)
    end)
  else
    local args = {}
    vim.ui.input({ prompt = "Args: " }, function(input)
      args = vim.split(input or "", " ")
    end)
    return args
  end
end

local js_based_languages = {
  {
    type = 'node2',
    name = 'Launch',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    type = 'node2',
    name = 'Attach',
    request = 'attach',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = "Vitest Debug",
    type = "pwa-node",
    request = "launch",
    cwd = vim.fn.getcwd(),
    program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
    args = { "--threads", "false", "run", "${file}" },
    autoAttachChildProcesses = true,
    smartStep = true,
    console = "integratedTerminal",
    skipFiles = { "<node_internals>/**", "node_modules/**" },
  },
}

local chrome_debugger = {
  type = "pwa-chrome",
  request = "launch",
  name = "Chrome",
  webRoot = "${workspaceFolder}",
}

local go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug (Arguments)",
    request = "launch",
    program = "${file}",
    args = get_arguments
  },
  {
    type = "go",
    name = "Debug Test (main)",
    request = "launch",
    mode = "test",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug Test (package)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
  },
  {
    type = "go",
    name = "Attach To Port (:9080)",
    mode = "remote",
    request = "attach",
    port = "9080"
  },
}

local cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/')
    end,
    env = {
      ASPNETCORE_ENVIRONMENT = function()
        return vim.fn.input("Development")
      end,
      ASPNETCORE_URLS = function()
        return vim.fn.input("http://localhost:")
      end,
    },
    cwd = function()
      return vim.fn.getcwd()
    end,
  },
}

return {
  setup = function(dap)
    dap.configurations = {
      javascript = js_based_languages,
      typescript = js_based_languages,
      javascriptreact = chrome_debugger,
      typescriptreact = chrome_debugger,
      go = go,
      cs = cs,
    }
  end
}
