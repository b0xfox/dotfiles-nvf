{
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
}
