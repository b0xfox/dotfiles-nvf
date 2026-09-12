{
  pkgs,
  lib,
  simple-dark,
  ...
}:
{
  config.vim = {

    viAlias = true;
    vimAlias = true;

    luaConfigRC.theme = ''
      vim.cmd([[colorscheme simple-dark-transparent]])
      vim.cmd([[set fillchars=eob:\ ,]])
    '';

    globals = {
      mapleader = " ";
      maplocalleader = ",";
      have_nerd_font = true;
    };

    options = import ./options.nix;

    diagnostics = {
      enable = true;
      config = {
        underline = true;
        update_in_insert = false;
        virtual_text = true;
        signs.text = lib.generators.mkLuaInline ''
          {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.HINT] = "󱠃",
            [vim.diagnostic.severity.INFO] = " ",
          }
        '';
      };
    };

    # Keys
    keymaps = [
      {
        desc = "Set highlight on search, but clear on pressing <Esc> in normal mode";
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
        silent = true;
      }
      {
        desc = "Move focus to the left window";
        mode = "n";
        key = "<C-h>";
        action = "<cmd>TmuxNavigateLeft<CR>";
        silent = true;
      }
      {
        desc = "Move focus to the right window";
        mode = "n";
        key = "<C-l>";
        action = "<cmd>TmuxNavigateRight<CR>";
        silent = true;
      }
      {
        desc = "Move focus to the lower window";
        mode = "n";
        key = "<C-j>";
        action = "<cmd>TmuxNavigateDown<CR>";
        silent = true;
      }
      {
        desc = "Move focus to the upper window";
        mode = "n";
        key = "<C-k>";
        action = "<cmd>TmuxNavigateUp<CR>";
        silent = true;
      }
      {
        desc = "Go up by half page";
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        silent = true;
      }
      {
        desc = "Go down by half page";
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        silent = true;
      }
      {
        desc = "Go up by full page";
        mode = "n";
        key = "<C-f>";
        action = "<C-f>zz";
        silent = true;
      }
      {
        desc = "Go down by full page";
        mode = "n";
        key = "<C-b>";
        action = "<C-b>zz";
        silent = true;
      }
      {
        desc = "Ctrl+Backspace delete previous word when in insert";
        mode = "i";
        key = "<C-BS>";
        action = "<C-w>";
        silent = true;
      }
      {
        desc = "Exit terminal mode | Note: This won't work in all terminal emulators/tmux/etc";
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        silent = true;
      }
      {
        desc = "Go to definition";
        mode = "n";
        key = "<leader>gd";
        action = "<cmd> lua vim.lsp.buf.definition() <cr>";
        silent = true;
      }
      {
        desc = "Code Actions";
        mode = "n";
        key = "<leader>ca";
        action = "<CMD>lua vim.lsp.buf.code_action()<CR>";
        silent = true;
      }
      {
        desc = "Show diagnostic [E]rror messages";
        mode = "n";
        key = "<leader>e";
        silent = true;
        lua = true;
        action = ''
          function ()
              vim.diagnostic.open_float()
          end
        '';
      }
      {
        desc = "Open diagnostic [Q]uickfix list";
        mode = "n";
        key = "<leader>q";
        silent = true;
        lua = true;
        action = ''
          function ()
              vim.diagnostic.setloclist()
          end
        '';
      }
      {
        desc = "Toggle breakpoint (Dap)";
        mode = "n";
        key = "<leader>db";
        action = "<CMD> DapToggleBreakpoint <CR>";
        silent = true;
      }
      {
        desc = "Open debugging sidebar (Dap)";
        mode = "n";
        key = "<leader>dus";
        silent = true;
        lua = true;
        action = ''
          function ()
              local widgets = require('dap.ui.widgets')
              local sidebar = widgets.sidebar(widgets.scopes)
              sidebar.open()
          end
        '';
      }
      {
        desc = "conform-nvim format";
        mode = [
          "n"
          "v"
        ];
        key = "<leader>f";
        silent = true;
        lua = true;
        action = ''
          function()
              require('conform').format({
                  lsp_fallback = true,
                  async = false,
                  timeout_ms = 500,
              })
          end
        '';
      }
      {
        desc = "Open Parent Directory (Oil.nvim)";
        mode = "n";
        key = "-";
        action = "<CMD>Oil<CR>";
        silent = true;
        unique = true;
      }
      {
        desc = "Telescope view marks";
        mode = "n";
        key = "<leader>mm";
        silent = true;
        lua = true;
        action = ''
          function()
              local ignored_marks = { "'", "`", '"', "[", "]", "<", ">" }
              local all_marks = vim.fn.getmarklist()
              local user_marks = {}

              for i = 0, 9 do
                  table.insert(ignored_marks, tostring(i))
              end

              for _, mark in ipairs(all_marks) do
                  if not vim.list_contains(ignored_marks, mark.mark) then
                      table.insert(user_marks, mark)
                  end
              end

              require('telescope.builtin').marks({ marks = user_marks })
          end
        '';
      }
      {
        desc = "Clear marks";
        mode = "n";
        key = "<leader>dm";
        action = "<cmd>delmarks A-Z0-9 | delmarks!<CR>";
        silent = true;
        unique = true;
      }
      {
        desc = "Toggle CodeCompanion Chat";
        mode = [
          "n"
          "v"
        ];
        key = "<leader>ai";
        silent = true;
        action = "<cmd>CodeCompanionChat Toggle<CR>";
      }
    ];

    # Plugins
    autopairs.nvim-autopairs.enable = true;

    autocomplete.blink-cmp = {
      enable = true;
      setupOpts = {
        keymap.preset = "default";
      };
    };

    mini = {
      surround.enable = true;
      icons.enable = true;

      ai = {
        enable = true;
        setupOpts = {
          n_lines = 500;
        };
      };

      align = {
        enable = true;
      };
    };

    statusline.lualine = import ./lualine.nix;

    languages = {

      enableTreesitter = true;

      json = {
        enable = true;
        format.enable = true;
      };

      nix = {
        enable = true;
        lsp.enable = true;
      };

      lua = {
        enable = true;
        lsp.enable = true;
      };

      rust = {
        enable = true;
        dap.enable = true;
        lsp.enable = true;
      };

      java = {
        enable = true;
        lsp.enable = true;
      };

      svelte = {
        enable = true;
        lsp.enable = true;
        format.enable = true;
      };

      qml = {
        enable = true;
        lsp.enable = false;
        format.enable = true;
      };

      typescript.enable = true;
      python.enable = true;
      csharp.enable = true;
    };

    lsp.presets.rust-analyzer.enable = true;

    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          rs = [ "rustfmt" ];
          lua = [ "stylua" ];
          python = [
            "isort"
            "black"
          ];
        };
        #format_on_save = {
        #    lsp_fallback = true;
        #    async = false;
        #    timeout_ms = 1000;
        #};
      };
    };

    telescope = {
      enable = true;
      mappings = {
        findFiles = "<leader>ff";
        liveGrep = "<leader>fg";
        buffers = "<leader><leader>";
      };
    };

    utility.yazi-nvim = {
      enable = true;
      mappings = {
        yaziToggle = "<leader>_";
        openYazi = "<leader>-";
        openYaziDir = "<leader>cw";
      };
      setupOpts = {
        open_for_directories = false;
        #yazi_floating_window_border = "none";
        keymaps = {
          show_help = "<f1>";
        };
      };
    };

    utility.oil-nvim = {
      enable = true;
      setupOpts = {
        default_file_explorer = true;
        delete_to_trash = true;
        watch_for_changes = true;
        columns = [ "icon" ];
        #view_options = {
        #  is_always_hidden = ''
        #    function(name, _)
        #      return name == '..' or name == '.git'
        #    end,
        #  '';
        #};
        win_options = {
          wrap = false;
        };
      };
    };

    utility.motion.flash-nvim = {
      enable = true;
      setupOpts = {
        modes = {
          char.enabled = false;
        };
      };
    };

    assistant.codecompanion-nvim = {
      enable = true;
      setupOpts = {
        adapters = lib.generators.mkLuaInline ''
          {
                 http = {
                    codellama = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        name = "codellama",
                        schema = {
                            model = {
                                default = 'codellama:7b',
                            },
                            think = {
                                default = false,
                            },
                            keep_alive = {
                                default = "5m",
                            },
                        },
                    })
                    end,
                }
            }
        '';
        strategies = {
          chat = {
            adapter = "codellama";
          };
        };
      };
    };

    dashboard.dashboard-nvim = {
      enable = true;
      setupOpts = {
        theme = "doom";
        config = {
          header = [
            "         "
            "         "
            "  ʕ•ᴥ•ʔ  "
            "         "
            "         "
          ];
          center = [
            {
              icon = " ";
              icon_hl = "Title";
              desc = "Find File";
              desc_hl = "String";
              key = "b";
              keymap = "SPC f f";
              key_hl = "Number";
              key_format = " %s";
              action = "lua print(8)";
            }
            {
              icon = " ";
              desc = "Find Dotfiles";
              key = "f";
              keymap = "SPC f d";
              key_format = " %s";
              action = "lua print(3)";
            }
          ];
          footer = [
            "     "
            "  FOOT   "
          ];
        };
      };
    };

    ui.colorizer = {
      enable = true;
      setupOpts = {
        filetypes = {
          javascript = { };
        };
      };
    };

    ui.noice = {
      enable = true;
      setupOpts = {
        cmdline.view = "cmdline";
      };
    };

    extraPlugins = {
      vim-tmux-navigator = {
        package = pkgs.vimPlugins.vim-tmux-navigator;
      };
      vim-tpipeline = {
        package = pkgs.vimPlugins.vim-tpipeline;
      };
      nvim-jdtls = {
        package = pkgs.vimPlugins.nvim-jdtls;
      };
      simple-dark = {
        package = pkgs.vimUtils.buildVimPlugin {
          name = "simple-dark";
          src = simple-dark;
        };
      };
    };
  };
}
