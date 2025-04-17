{lib, ...}: {
  vim.keymaps = [
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>m .+1<cr>==";
      desc = "Move Down";
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>m .-2<cr>==";
      desc = "Move Up";
    }
    {
      mode = "i";
      key = "<A-j>";
      action = "<esc><cmd>m .+1<cr>==gi";
      desc = "Move Down";
    }
    {
      mode = "i";
      key = "<A-k>";
      action = "<esc><cmd>m .-2<cr>==gi";
      desc = "Move Up";
    }
    {
      mode = "n";
      key = "<leader>fa";
      action = ":!alejandra %<CR>";
      silent = true;
    }

    # NOTE: Snacks Stuff
    {
      mode = "n";
      key = "\\";
      action = ''
        function()
          if Snacks.picker.get({ source = "explorer" })[1] == nil then
            Snacks.picker.explorer()
          elseif Snacks.picker.get({ source = "explorer" })[1]:is_focused() == true then
            Snacks.picker.explorer()
          elseif Snacks.picker.get({ source = "explorer" })[1]:is_focused() == false then
            Snacks.picker.get({ source = "explorer" })[1]:focus()
          end
        end,
      '';
      silent = true;
      desc = "Toggle Explorer";
    }
    {
      mode = "n";
      key = "<leader>sf";
      action = ":lua Snacks.picker.files()<CR>";
      desc = "Find Files";
      silent = true;
    }
    {
      mode = "n";
      key = "<leader>lg";
      action = ":lua Snacks.lazygit()<CR>";
      desc = "Find Files";
      silent = true;
    }
  ];
}
