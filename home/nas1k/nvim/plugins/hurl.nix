{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    hurl
    jq
  ];

  plugins.hurl = {
    enable = true;

    settings = {
      mode = "split";
      show_notification = false;

      formatters = {
        json = [ "jq" ];
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ar";
      action = "<cmd>HurlRunnerAt<cr>";
      options.desc = "[A]PI [R]un request";
    }
    {
      mode = "n";
      key = "<leader>aR";
      action = "<cmd>HurlRunner<cr>";
      options.desc = "[A]PI [R]un all";
    }
    {
      mode = "n";
      key = "<leader>ae";
      action = "<cmd>HurlRunnerToEntry<cr>";
      options.desc = "[A]PI run to [E]ntry";
    }
    {
      mode = "n";
      key = "<leader>aE";
      action = "<cmd>HurlRunnerToEnd<cr>";
      options.desc = "[A]PI run from entry to [E]nd";
    }
    {
      mode = "n";
      key = "<leader>am";
      action = "<cmd>HurlToggleMode<cr>";
      options.desc = "[A]PI toggle response [M]ode";
    }
  ];
}
