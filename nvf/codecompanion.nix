{ lib, ... }:
{
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
}
