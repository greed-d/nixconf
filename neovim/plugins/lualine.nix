{lib, ...}: {
  vim = {
    statusline.lualine = {
      enable = true;

      activeSection = {
        a = [
          ''
            {
              "mode",
              icons_enabled = true,
              separator = {
                left = "",
                right = ""
              },
            }
          ''
          ''
            {
              "",
              draw_empty = true,
              separator = { left = "", right = '' }
            }
          ''
        ];
        b = [
          ''
            {
              "branch",
              icon = '',
              separator = {left = "", right = ""}
            }
          ''
        ];
        c = [
          ''
            {
              "diff",
              diff_color = {
                -- Same color values as the general color option can be used here.
                added    = 'GitSignsAdd',    -- Changes the diff's added color
                modified = 'GitSignsChange', -- Changes the diff's modified color
                removed  = 'GitSignsDelete', -- Changes the diff's removed color you
              },
              symbols = { added = ' ', modified = ' ', removed = ' ' },
              colored = true,
            }
          ''
        ];
        x = [
          ''
            {
              "diagnostics",
              sources = {'nvim_lsp', 'nvim_diagnostic', 'nvim_diagnostic', 'vim_lsp', 'coc'},
              symbols = {error = '󰅙 ', warn = ' ', info = ' ', hint = '󰌵 '},
              colored = true,
              update_in_insert = false,
              always_visible = false,
              diagnostics_color = {
                color_error = { fg = 'red' },
                color_warn = { fg = 'yellow' },
                color_info = { fg = 'cyan' },
              },
            }
          ''
        ];
        y = [
          ''
            {
                -- Lsp server name
                function()
                  local buf_ft = vim.bo.filetype
                  local excluded_buf_ft = { toggleterm = true, NvimTree = true, ["neo-tree"] = true, TelescopePrompt = true }

                  if excluded_buf_ft[buf_ft] then
                    return ""
                    end

                  local bufnr = vim.api.nvim_get_current_buf()
                  local clients = vim.lsp.get_clients({ bufnr = bufnr })

                  if vim.tbl_isempty(clients) then
                    return "No Active LSP"
                  end

                  local active_clients = {}
                  for _, client in ipairs(clients) do
                    table.insert(active_clients, client.name)
                  end

                  return table.concat(active_clients, ", ")
                end,
                icon = '  LSP ~',
                align = "left",
                separator = {left = ''},
              }
          ''
        ];
        z = [
          ''
            {
              "",
              draw_empty = true,
              separator = { left = '', right = "" }
            }
          ''
          ''
            {"location",
            icon = "󰦨",
            align = "right",
            separator = { left = "", right = "" }
            }
          ''

          ''
            {
              "searchcount",
              maxcount = 999,
              timeout = 120,
              separator = { left = "", right = "" }
            }
          ''
        ];
      };
    };
  };
}
