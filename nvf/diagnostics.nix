{ lib, ... }:
{
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
}
