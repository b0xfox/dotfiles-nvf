{

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
}
