{
  keymaps = [
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
    }
    {
      mode = "n";
      key = "<leader>le";
      action.__raw = "vim.diagnostic.open_float";
      options.desc = "Show diagnostic [E]rror messages";
    }
    {
      mode = "n";
      key = "<leader>lq";
      action.__raw = "vim.diagnostic.setloclist";
      options.desc = "Open diagnostic [Q]uickfix list";
    }
    {
      mode = "n";
      key = "<leader>w";
      action = "<cmd>w<CR>";
      options.desc = "Save/[W]rite buffer";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>q<CR>";
      options.desc = "[Q]uit";
    }
    {
      mode = "t";
      key = "<Esc><Esc>";
      action = "<C-\\><C-n>";
      options.desc = "Exit terminal mode";
    }
    {
      mode = "n";
      key = "U";
      action = "<C-r>";
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<cmd>wincmd h<cr>";
      options.desc = "Move focus to the left window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<cmd>wincmd l<cr>";
      options.desc = "Move focus to the right window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<cmd>wincmd k<cr>";
      options.desc = "Move focus to the upper window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<cmd>wincmd j<cr>";
      options.desc = "Move focus to the lower window";
    }
    {
      mode = "n";
      key = "<C-M-s>";
      action = "<cmd>vert res +3<cr>";
      options.desc = "Resize window left";
    }
    {
      mode = "n";
      key = "<C-M-g>";
      action = "<cmd>vert res -3<cr>";
      options.desc = "Resize window right";
    }
    {
      mode = "n";
      key = "<C-M-d>";
      action = "<cmd>res -3<cr>";
      options.desc = "Resize window up";
    }
    {
      mode = "n";
      key = "<C-M-f>";
      action = "<cmd>res +3<cr>";
      options.desc = "Resize window down";
    }
    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>bp| bd #<CR>";
      options.desc = "[X] Close buffer";
    }
    {
      mode = "n";
      key = "-";
      action = "<CMD>Oil<CR>";
      options.desc = "Open parent directory";
    }
    {
      mode = "n";
      key = "<leader>X";
      options.desc = "[X] Close all other buffers";
      action.__raw = ''
        function()
          local cur = vim.api.nvim_get_current_buf()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if buf ~= cur and vim.api.nvim_buf_is_loaded(buf) then
              vim.api.nvim_buf_delete(buf, { force = true })
            end
          end
        end
      '';
    }
    {
      mode = "n";
      key = "<leader><CR>";
      options.desc = "Telescope: Buffers with Preview";
      action.__raw = ''
        function()
          require('telescope.builtin').buffers({
            sort_lastused = true,
            sort_mru = true,
            ignore_current_buffer = false,
            previewer = true,
            layout_strategy = "horizontal",
            layout_config = {
              width = 0.9,
              preview_cutoff = 120,
              prompt_position = "top",
            },
          })
        end
      '';
    }
    {
      mode = "n";
      key = "<leader>kfb";
      options.desc = "[K]ustomize [F]lux [B]uild";
      action.__raw = ''
        function()
          local bf = vim.fn.expand('%')
          vim.cmd("vnew")
          vim.cmd("setlocal buftype=nofile")
          vim.cmd(string.format(
            "execute 'r !flux build ks $(cat %s | yq -r \".metadata.name\") --kustomization-file %s --path $(cat %s | yq -r \".spec.path\") --dry-run'",
            bf, bf, bf))
          vim.cmd("setlocal filetype=yaml")
          vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>bd!<CR>", { noremap = true, silent = true })
        end
      '';
    }
    {
      mode = "n";
      key = "<leader>kfd";
      options.desc = "[K]ustomize [F]lux [D]iff";
      action.__raw = ''
        function()
          local bf = vim.fn.expand('%')
          vim.cmd("new")
          vim.cmd("setlocal buftype=nofile")
          vim.cmd(string.format(
            "execute 'r !flux diff ks $(cat %s | yq -r \".metadata.name\") --kustomization-file %s --path $(cat %s | yq -r \".spec.path\") --dry-run'",
            bf, bf, bf))
          vim.cmd("setlocal filetype=yaml")
          vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>bd!<CR>", { noremap = true, silent = true })
        end
      '';
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<cr>";
      options.desc = "[G]o to Lazy[G]it";
    }
    {
      mode = "n";
      key = "<leader>gO";
      action = "<cmd>Octo pr list<cr>";
      options.desc = "[G]it [O]cto PR";
    }
    {
      mode = "n";
      key = "<leader>gP";
      action = "<cmd>Octo pr view<cr>";
      options.desc = "[G]it [P]ull Request";
    }
    {
      mode = "n";
      key = "<leader>gC";
      action = "<cmd>Octo pr create draft<cr>";
      options.desc = "[G]it Pull Request [C]reate";
    }
    {
      mode = "n";
      key = "<leader>gR";
      action = "<cmd>Octo pr ready<cr>";
      options.desc = "[G]it Pull Request [R]eady";
    }
    {
      mode = "n";
      key = "<leader>tf";
      action.__raw = ''
        function()
          local bufnr = vim.api.nvim_get_current_buf()

          vim.b[bufnr].disable_autoformat =
            not vim.b[bufnr].disable_autoformat
        end
      '';
      options.desc = "[T]oggle LSP [F]ormat buffer";
    }

    {
      mode = "n";
      key = "<leader>tF";
      action.__raw = ''
        function()
          vim.g.disable_autoformat =
            not vim.g.disable_autoformat
        end
      '';
      options.desc = "[T]oggle LSP [F]ormat global";
    }
    {
      mode = "n";
      key = "<leader>tb";
      action = "<cmd>GitBlameToggle<cr>";
      options.desc = "[T]oggle Git [B]lame";
    }
    {
      mode = "n";
      key = "<leader>go";
      action = "<cmd>GitBlameOpenCommitURL<cr>";
      options.desc = "[G]it [O]pen Commit URL";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>fr";

      action.__raw = ''
        function()
          local ext

          if vim.bo.buftype == "" then
            ext = vim.fn.expand("%:e")
          end

          require("grug-far").open({
            transient = true,
            prefills = {
              filesFilter =
                ext ~= nil
                and ext ~= ""
                and ("*." .. ext)
                or nil,
            },
          })
        end
      '';

      options.desc = "Search and Replace";
    }
  ];
}
