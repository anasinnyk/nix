{
  plugins = {
    neoclip.enable = true;
    telescope = {
      enable = true;

      enabledExtensions = [
        "hoogle"
        "neoclip"
      ];

      extensions = {
        fzf-native.enable = true;
        live-grep-args.enable = true;
        advanced-git-search.enable = true;

        ui-select = {
          enable = true;

          settings = {
            "__unkeyed-1".__raw = ''
              require("telescope.themes").get_dropdown()
            '';
          };
        };

        undo = {
          enable = true;

          settings = {
            use_delta = true;
            side_by_side = false;
            entry_format = "state #$ID, $STAT, $TIME";

            vim_diff_opts.ctxlen.__raw = "vim.o.scrolloff";

            mappings.i = {
              "<C-cr>" = "require('telescope-undo.actions').yank_additions";
              "<S-cr>" = "require('telescope-undo.actions').yank_deletions";
              "<cr>" = "require('telescope-undo.actions').restore";
            };
          };
        };
      };

      settings = {
        defaults = {
          vimgrep_arguments = [
            "rg"
            "--color=never"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
            "--smart-case"
            "--hidden"
            "--glob"
            "!**/.git/*"
          ];

          path_display = [ "truncate" ];

          mappings = {
            n = {
              "<C-w>".__raw = ''
                require("telescope.actions").send_selected_to_qflist
                  + require("telescope.actions").open_qflist
              '';

              "<M-c>".__raw = ''
                function(prompt_bufnr)
                  local actions = require("telescope.actions")
                  local action_state = require("telescope.actions.state")
                  local selection = action_state.get_selected_entry()

                  actions.close(prompt_bufnr)

                  if selection and selection.bufnr then
                    vim.api.nvim_buf_delete(
                      selection.bufnr,
                      { force = true }
                    )
                  end
                end
              '';
            };

            i = {
              "<C-j>".__raw = "require('telescope.actions').cycle_history_next";

              "<C-k>".__raw = "require('telescope.actions').cycle_history_prev";

              "<CR>".__raw = ''
                function(prompt_bufnr)
                  local actions = require("telescope.actions")
                  local action_state =
                    require("telescope.actions.state")

                  local picker =
                    action_state.get_current_picker(prompt_bufnr)

                  local selected = picker:get_multi_selection()

                  if vim.tbl_isempty(selected) then
                    actions.select_default(prompt_bufnr)
                    return
                  end

                  actions.close(prompt_bufnr)

                  for _, entry in ipairs(selected) do
                    local path = entry.path or entry.filename

                    if path then
                      vim.cmd.edit(vim.fn.fnameescape(path))
                    end
                  end
                end
              '';

              "<C-w>".__raw = ''
                require("telescope.actions").send_selected_to_qflist
                  + require("telescope.actions").open_qflist
              '';

              "<C-S-d>".__raw = "require('telescope.actions').delete_buffer";

              "<C-s>".__raw = "require('telescope.actions').cycle_previewers_next";

              "<C-a>".__raw = "require('telescope.actions').cycle_previewers_prev";

              "<M-c>".__raw = ''
                function(prompt_bufnr)
                  local actions = require("telescope.actions")
                  local action_state = require("telescope.actions.state")
                  local selection = action_state.get_selected_entry()

                  actions.close(prompt_bufnr)

                  if selection and selection.bufnr then
                    vim.api.nvim_buf_delete(
                      selection.bufnr,
                      { force = true }
                    )
                  end
                end
              '';
            };
          };
        };

        pickers.find_files.find_command = [
          "rg"
          "--files"
          "--hidden"
          "--glob"
          "!**/.git/*"
        ];
      };

      keymaps = {
        "<leader>fh" = {
          action = "help_tags";
          options.desc = "[F]ind [H]elp";
        };

        "<leader>fk" = {
          action = "keymaps";
          options.desc = "[F]ind [K]eymaps";
        };

        "<leader>ff" = {
          action = "find_files";
          options.desc = "[F]ind [F]iles";
        };

        "<leader>fs" = {
          action = "lsp_document_symbols";
          options.desc = "[F]ind [S]ymbols";
        };

        "<leader>fw" = {
          action = "grep_string";
          options.desc = "[F]ind current [W]ord";
        };

        "<leader>fg" = {
          action = "live_grep_args";
          options.desc = "[F]ind by [G]rep";
        };

        "<leader>fd" = {
          action = "diagnostics";
          options.desc = "[F]ind [D]iagnostics";
        };

        "<leader>f." = {
          action = "oldfiles";
          options.desc = "[F]ind recent files";
        };

        "<leader><leader>" = {
          action = "buffers";
          options.desc = "Find existing buffers";
        };

        "<leader>gc" = {
          action = "git_commits";
          options.desc = "Search [G]it [C]ommits";
        };

        "<leader>gb" = {
          action = "git_bcommits";
          options.desc = "Search Git commits for [B]uffer";
        };

        "<leader>fH" = {
          action = "hoogle";
          options.desc = "Search [H]oogle";
        };

        "<leader>fi" = {
          action = "advanced_git_search show_custom_functions";
          options.desc = "Advanced Git Search";
        };

        "<leader>f/" = {
          action = ''
            current_buffer_fuzzy_find
            theme=dropdown
            previewer=false
            winblend=10
            layout_config={"width":0.7}
          '';
          options.desc = "[F]ind in current buffer";
        };

        "<leader>fo" = {
          action = "live_grep grep_open_files=true";
          options.desc = "[F]ind in [O]pen files";
        };
      };
    };
  };
}
