{
  plugins.web-devicons.enable = true;
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        separator_style = "thin";
        diagnostics = "nvim_lsp";
        show_buffer_icons = true;
        close_command = "bp| bd #";
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<A-,>";
      action = "<Cmd>BufferLineCyclePrev<CR>";
      options.desc = "Go to previous buffer";
    }
    {
      mode = "n";
      key = "<A-.>";
      action = "<Cmd>BufferLineCycleNext<CR>";
      options.desc = "Go to next buffer";
    }
    {
      mode = "n";
      key = "<A-S-,>"; # <
      action = "<Cmd>BufferLineMovePrev<CR>";
      options.desc = "Move buffer to left";
    }
    {
      mode = "n";
      key = "<A-S-.>"; # >
      action = "<Cmd>BufferLineMoveNext<CR>";
      options.desc = "Move buffer to right";
    }
    {
      mode = "n";
      key = "<A-1>";
      action = "<Cmd>BufferLineGoToBuffer 1<CR>";
      options.desc = "Go to 1st buffer";
    }
    {
      mode = "n";
      key = "<A-2>";
      action = "<Cmd>BufferLineGoToBuffer 2<CR>";
      options.desc = "Go to 2nd buffer";
    }
    {
      mode = "n";
      key = "<A-3>";
      action = "<Cmd>BufferLineGoToBuffer 3<CR>";
      options.desc = "Go to 3rd buffer";
    }
    {
      mode = "n";
      key = "<A-4>";
      action = "<Cmd>BufferLineGoToBuffer 4<CR>";
      options.desc = "Go to 4th buffer";
    }
    {
      mode = "n";
      key = "<A-5>";
      action = "<Cmd>BufferLineGoToBuffer 5<CR>";
      options.desc = "Go to 5th buffer";
    }
    {
      mode = "n";
      key = "<A-6>";
      action = "<Cmd>BufferLineGoToBuffer 6<CR>";
      options.desc = "Go to 6th buffer";
    }
    {
      mode = "n";
      key = "<A-7>";
      action = "<Cmd>BufferLineGoToBuffer 7<CR>";
      options.desc = "Go to 7th buffer";
    }
    {
      mode = "n";
      key = "<A-8>";
      action = "<Cmd>BufferLineGoToBuffer 8<CR>";
      options.desc = "Go to 8th buffer";
    }
    {
      mode = "n";
      key = "<A-9>";
      action = "<Cmd>BufferLineGoToBuffer 9<CR>";
      options.desc = "Go to 9th buffer";
    }
    {
      mode = "n";
      key = "<A-0>";
      action = "<Cmd>BufferLineGoToBuffer -1<CR>";
      options.desc = "Go to last buffer";
    }
    {
      mode = "n";
      key = "<A-p>";
      action = "<Cmd>BufferLineTogglePin<CR>";
      options.desc = "Pin buffer";
    }
    {
      mode = "n";
      key = "<A-c>";
      action = "<Cmd>bp| bd #<CR>";
      options.desc = "Close buffer";
    }
    {
      mode = "n";
      key = "<leader>bc";
      action = "<Cmd>BufferLineCloseOthers<CR>";
      options.desc = "[B]uffers [c]lose but [c]urrent";
    }
    {
      mode = "n";
      key = "<leader>bl";
      action = "<Cmd>BufferLineCloseLeft<CR>";
      options.desc = "[B]uffers [c]lose [l]eft";
    }
    {
      mode = "n";
      key = "<leader>br";
      action = "<Cmd>BufferLineCloseRight<CR>";
      options.desc = "[B]uffers [c]lose [r]ight";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<Cmd>BufferLineSortByDirectory<CR>";
      options.desc = "[B]uffers [o]rder by [d]irectory";
    }
    {
      mode = "n";
      key = "<leader>bL";
      action = "<Cmd>BufferLineSortByExtension<CR>";
      options.desc = "[B]uffers [o]rder by [l]anguage";
    }
    {
      mode = "n";
      key = "<leader>bs";
      action = "<Cmd>BufferLinePick<CR>";
      options.desc = "[B]uffers [S]elect";
    }
  ];
}
