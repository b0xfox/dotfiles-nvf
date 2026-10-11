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

    globals = import ./globals.nix;

    options = import ./options.nix;

    lsp.presets = import ./lsp-presets.nix;

    diagnostics = import ./diagnostics.nix { inherit lib; };

    keymaps = import ./keymaps.nix;

    languages = import ./languages.nix;

    mini = import ./mini.nix;

    statusline.lualine = import ./lualine.nix;

    autocomplete.blink-cmp = import ./blink-cmp.nix;

    autopairs.nvim-autopairs.enable = true;

    formatter.conform-nvim = import ./conform.nix;

    telescope = import ./telescope.nix;

    utility.yazi-nvim = import ./yazi.nix;

    utility.oil-nvim = import ./oil.nix;

    utility.motion.flash-nvim = import ./flash.nix;

    #assistant.codecompanion-nvim = import ./codecompanion.nix { inherit lib; };

    dashboard.dashboard-nvim = import ./dashboard.nix;

    ui.colorizer = import ./colorizer.nix;

    ui.noice = import ./noice.nix;

    terminal.toggleterm = import ./toggleterm.nix;

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
