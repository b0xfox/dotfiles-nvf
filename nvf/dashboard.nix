{

  enable = true;

  setupOpts = {

    theme = "doom";

    config = {

      header = [
          ""
          ""
          "               ,-.      .-,                     "
          "               |-.\\ __ /.-|                     "
          "               \\  `    `  /                     "
          "               / _     _  \\                     "
          "               | _`q  p _ |                     "
          "               '._=/  \\=_.'                     "
          "                 {`\\()/`}`\\                     "
          "                 {      }  \\                    "
          "                 |{    }    \\                   "
          "                 \\ '--'   .- \\                  "
          "                 |-      /    \\                 "
          "                 | | | | |     ;                "
          "                 | | |.;.,..__ |                "
          "               .-\"\";`         `|                "
          "              /    |           /                "
          "              `-../____,..---'`                 "
          ""
          ""
          ""
          ""
          ""
          ""
      ];

      center = [
        {
          icon = "  ";
          desc = "Open Oil Buffer";
          action = "Oil";
        }
        {
          icon = "󱠢  ";
          desc = "Say hi";
          action = "lua print('hiya ʕ•ᴥ•ʔ')";
        }
      ];

      footer = [
        "     "
      ];

    };
  };
}
