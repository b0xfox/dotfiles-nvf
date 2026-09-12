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

    autopairs.nvim-autopairs.enable = true;

    lsp.presets.rust-analyzer.enable = true;

    globals = import ./globals.nix;

    options = import ./options.nix;

    diagnostics = import ./diagnostics.nix { inherit lib; };

    keymaps = import ./keymaps.nix;

    autocomplete.blink-cmp = import ./blink-cmp.nix;

    mini = import ./mini.nix;

    statusline.lualine = import ./lualine.nix;

    languages = import ./languages.nix;

    formatter.conform-nvim = import ./conform.nix;

    telescope = import ./telescope.nix;

    utility.yazi-nvim = import ./yazi.nix;

    utility.oil-nvim = import ./oil.nix;

    utility.motion.flash-nvim = import ./flash.nix;

    assistant.codecompanion-nvim = import ./codecompanion.nix { inherit lib; };

    dashboard.dashboard-nvim = import ./dashboard.nix;

    ui.colorizer = import  ./colorizer.nix;

    ui.noice = import  ./noice.nix;

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
