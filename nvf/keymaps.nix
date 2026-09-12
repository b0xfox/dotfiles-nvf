[

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

]
