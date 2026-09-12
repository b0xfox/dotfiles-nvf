{
  enable = true;

  setupOpts = {

    options = {

      theme = "auto";

      icons_enabled = true;

      globalstatus = false;

      component_separators = {
        left = "";
        right = "";
      };

      section_separators = {
        left = "";
        right = "";
      };

    };

    sections = {

      lualine_a = [
        {
          "@1" = "mode";
          icons_enabled = true;
        }
      ];

      lualine_b = [
        {
          "@1" = "filename";
          icons_enabled = true;
        }
      ];

      lualine_c = [
        {
          "@1" = "";
          draw_empty = true;
        }
      ];

      lualine_y = [
        {
          "@1" = "diagnostics";
          icons_enabled = true;
          sources = [
            "nvim_diagnostic"
            "coc"
          ];
          sections = [
            "error"
            "warn"
            "info"
            "hint"
          ];
          diagnostics_color = {
            error = "DiagnosticError";
            warn = "DiagnosticWarn";
            info = "DiagnosticInfo";
            hint = "DiagnosticHint";
          };
          symbols = {
            error = "E";
            warn = "W";
            info = "I";
            hint = "H";
          };
          colored = true;
          update_in_insert = false;
          always_visible = false;
        }
      ];

      lualine_z = [
        {
          "@1" = "location";
          icons_enabled = true;
        }
      ];

    };

    inactive_sections = {

      lualine_a = [
        {
          "@1" = "filename";
          icons_enabled = true;
        }
      ];

      lualine_y = [
        {
          "@1" = "";
          draw_empty = true;
        }
      ];

      lualine_z = [
        {
          "@1" = "location";
          icons_enabled = true;
        }
      ];

    };
  };
}
