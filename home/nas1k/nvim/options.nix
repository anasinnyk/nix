{
    globals = {
      mapleader = " ";
      maplocalleader = "\\";
      have_nerd_font = true;
    };
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      colorcolumn = "121";
      showmode = false;
      clipboard = "unnamedplus";
      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      background = "dark";
      list = true;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };
      inccommand = "split";
      cursorline = true;
      scrolloff = 10;
      hlsearch = true;
    };
    autoGroups = {
      highlight-yank = { clear = true; };
    };
    autoCmd = [
      {
        event = [ "TextYankPost" ];
        desc = "Highlight when yanking (copping) text";
        group = "highlight-yank";
        callback.__raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }
      {
        event = [ "FileType" ];
        pattern = [ "grug-far" ];

        callback.__raw = ''
          function(event)
            vim.keymap.set(
              "n",
              "<Esc>",
              "<Cmd>stopinsert | bd!<CR>",
              {
                buffer = event.buf,
              }
            )
          end
        '';
      }
    ];
    plugins.web-devicons.enable = true;
}
