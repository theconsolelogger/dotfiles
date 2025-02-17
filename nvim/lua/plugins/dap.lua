return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui", -- UI for nvim-dap
      "jay-babu/mason-nvim-dap.nvim", -- Mason integration for nvim-dap
    },
    opts = function(_, opts)
      local dap = require("dap")

      -- Configure PHP adapter
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { "/Users/jon/Development/vscode-php-debug/out/phpDebug.js" }, -- Update this path
      }

      -- Configure PHP debugging
      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
        },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      local dapui = require("dapui")
      dapui.setup()

      -- Automatically open/close the UI when debugging starts/stops
      local dap = require("dap")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
