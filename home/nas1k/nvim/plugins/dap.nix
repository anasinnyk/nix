{ lib, ... }:

{
  plugins = {
    dap.enable = true;
    dap-ui.enable = true;
    dap-go.enable = true;
    dap-virtual-text.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "du";
      action = lib.nixvim.mkRaw "require('dapui').toggle";
      options.desc = "Toggle DAP UI";
    }
    {
      mode = "n";
      key = "dU";
      action = lib.nixvim.mkRaw "require('dap').repl.toggle";
      options.desc = "Toggle DAP REPL";
    }
    {
      mode = "n";
      key = "db";
      action = lib.nixvim.mkRaw "require('dap').toggle_breakpoint";
      options.desc = "Toggle DAP Breakpoint";
    }
    {
      mode = "n";
      key = "dB";
      action = lib.nixvim.mkRaw "require('dap').clear_breakpoints";
      options.desc = "Clear DAP Breakpoints";
    }
    {
      mode = "n";
      key = "d?";
      action = lib.nixvim.mkRaw ''
        function()
          require('dap').toggle_breakpoint(
            vim.fn.input('Breakpoint condition: ')
          )
        end
      '';
      options.desc = "Conditional DAP Breakpoint";
    }
    {
      mode = "n";
      key = "dk";
      action = lib.nixvim.mkRaw "require('dap').close";
      options.desc = "Terminate DAP Session";
    }
    {
      mode = "n";
      key = "dc";
      action = lib.nixvim.mkRaw "require('dap').continue";
      options.desc = "Continue DAP Session";
    }
    {
      mode = "n";
      key = "dC";
      action = lib.nixvim.mkRaw "require('dap').run_to_cursor";
      options.desc = "Run to Cursor";
    }
    {
      mode = "n";
      key = "di";
      action = lib.nixvim.mkRaw "require('dap').step_into";
      options.desc = "Step Into";
    }
    {
      mode = "n";
      key = "do";
      action = lib.nixvim.mkRaw "require('dap').step_over";
      options.desc = "Step Over";
    }
    {
      mode = "n";
      key = "dO";
      action = lib.nixvim.mkRaw "require('dap').step_out";
      options.desc = "Step Out";
    }
    {
      mode = "n";
      key = "de";
      action = lib.nixvim.mkRaw "require('dapui').eval";
      options.desc = "Evaluate Expression";
    }
  ];

  extraConfigLua = ''
    local dap = require("dap")
    local dapui = require("dapui")

    vim.fn.sign_define("DapBreakpoint", {
      text = "🔴",
      texthl = "",
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapBreakpointCondition", {
      text = "🟡",
      texthl = "",
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapBreakpointRejected", {
      text = "⭕",
      texthl = "",
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapLogPoint", {
      text = "🔵",
      texthl = "",
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapStopped", {
      text = "🟢",
      texthl = "",
      linehl = "",
      numhl = "",
    })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  '';
}
