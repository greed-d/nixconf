{lib, ...}: {
  vim.utility.snacks-nvim.setupOpts.picker = {
    layout = {
      preset = lib.generators.mkLuaInline ''
             function ()
               return vim.o.columns >= 120 and "telescope" or "vertical"
        end
      '';
    };
    layouts = {
      telescope = lib.generators.mkLuaInline ''
          {
          reverse = false,
          layout = {
            box = "horizontal",
            backdrop = false,
            width = 0.8,
            height = 0.9,
            border = "none",
            {
              box = "vertical",
              {
                win = "input",
                height = 1,
                border = "rounded",
                title = "{title} {live} {flags}",
                title_pos = "center",
              },
              { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
            },
            {
              win = "preview",
              title = "{preview:Preview}",
              width = 0.51,
              border = "rounded",
              title_pos = "center",
            },
          },
        },
      '';
    };
    sources = {
      files = {};
      explorer = {
        layout = {
          layout = {
            position = "right";
          };
        };
        win = {
          list = {
            wo = {};
          };
        };
      };
      lines = {
        layout = {
          preset = lib.generators.mkLuaInline ''
            function()
                   return vim.o.columns >= 120 and "telescope" or "vertical"
            end
          '';
        };
      };
    };
  };
}
