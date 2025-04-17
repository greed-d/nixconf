{lib, ...}: {
  vim.utility.snacks-nvim.setupOpts.picker = {
    layout = {
      # The default layout for "telescopy" pickers, e.g. `files`, `commands`, ...
      # It will not override non-standard pickers, e.g. `explorer`, `lines`, ...
      preset = lib.generators.mkLuaInline ''
        return vim.o.columns >= 120 and 'telescope' or 'vertical'
      '';
    };
    # layouts = {
    #   telescope = {
    #     # Copy from https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#telescope
    #     reverse = false;
    #     layout = {
    #       box = "horizontal";
    #       backdrop = false;
    #       width = 0.8; # Change the width
    #       height = 0.9;
    #       border = "none";
    #       columns = [
    #         {
    #           box = "vertical";
    #           rows = [
    #             {
    #               win = "input";
    #               height = 1;
    #               border = "rounded";
    #               title = "{title} {live} {flags}";
    #               title_pos = "center";
    #             }
    #             {
    #               win = "list";
    #               title = " Results ";
    #               title_pos = "center";
    #               border = "rounded";
    #             }
    #           ];
    #         }
    #         {
    #           win = "preview";
    #           title = "{preview:Preview}";
    #           width = 0.51; # Change the preview width
    #           border = "rounded";
    #           title_pos = "center";
    #         }
    #       ];
    #     };
    #   };
    # };
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
            return vim.o.columns >= 120 and 'telescope' or 'vertical'
          '';
        };
      };
    };
  };
}
