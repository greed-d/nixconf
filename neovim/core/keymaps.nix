_: {
  vim.keymaps = [
    #Useful Keymaps
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
    {
      mode = ["n" "x"];
      key = "p";
      action = "p:let @\"=@0<CR>";
      silent = true;
    }

    {
      mode = "n";
      key = "<S-CR>";
      action = "O<Esc>";
      desc = "Add new line above";
    }

    {
      mode = "n";
      key = "<CR>";
      action = "o<Esc>";
      desc = "Add new line below";
    }

    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<CR>";
      desc = "file save";
    }

    {
      mode = "n";
      key = "<C-c>";
      action = "<cmd>%y+<CR>";
      desc = "file copy whole";
    }

    {
      mode = ["n" "v" "t" "x"];
      key = "<A-,>";
      action = "<C-w><";
      desc = "Decrease window size";
    }

    {
      mode = ["n" "v" "t" "x"];
      key = "<A-.>";
      action = "<C-w>>";
      desc = "Move indent left once";
    }

    {
      mode = ["i" "s"];
      key = "<C-k>";
      lua = true;
      action = ''
        function()
          vim.lsp.buf.hover { border = 'rounded' }
        end
      '';
    }

    # NOTE: Snacks Stuff
    {
      mode = "n";
      key = "<leader>sf";
      action = ":lua Snacks.picker.files()<CR>";
      desc = "Find Files";
      silent = true;
    }
    {
      mode = "n";
      key = "\\";
      lua = true;
      action = ''
            function()
          if Snacks.picker.get({ source = "explorer" })[1] == nil then
            Snacks.picker.explorer()
          elseif Snacks.picker.get({ source = "explorer" })[1]:is_focused() == true then
            Snacks.picker.explorer()
          elseif Snacks.picker.get({ source = "explorer" })[1]:is_focused() == false then
            Snacks.picker.get({ source = "explorer" })[1]:focus()
        end
            end
      '';
      desc = "File Explorer";
    }
    {
      mode = "n";
      key = "<leader>bk";
      lua = true;
      action = ''
        function()
          Snacks.bufdelete()
        end
      '';
    }

    {
      mode = "n";
      key = "<leader>bK";
      lua = true;
      action = ''
        function()
          Snacks.bufdelete.all()
        end
      '';
    }

    # Rename Files
    {
      mode = "n";
      key = "<leader>cR";
      lua = true;
      action = ''
        function()
          Snacks.rename.rename_file()
        end
      '';
      desc = "[C]ode Rename";
    }

    # Lazy Git
    {
      mode = "n";
      key = "<leader>lg";
      lua = true;
      action = ''
        function()
          Snacks.lazygit()
        end
      '';
      desc = "Lazygit";
    }

    # Git Stuff
    {
      mode = "n";
      key = "gX";
      lua = true;
      action = ''
        function()
          Snacks.gitbrowse()
        end
      '';
      desc = "Open remote url";
    }

    {
      mode = "n";
      key = "gb";
      lua = true;
      action = ''
        function()
          Snacks.git.blame_line()
        end
      '';
      desc = "Git: Blame Line";
    }

    # Notification stuff
    {
      mode = "n";
      key = "<leader>na";
      lua = true;
      action = ''
        function()
          Snacks.notifier.show_history()
        end
      '';
      desc = "Notification History";
    }

    {
      mode = "n";
      key = "<leader>nh";
      lua = true;
      action = ''
        function()
          Snacks.notifier.hide()
        end
      '';
      desc = "Dismiss All Notifications";
    }
    {
      mode = ["n" "t"];
      key = "<M-i>";
      lua = true;
      action = ''
        function()
          Snacks.terminal()
        end
      '';
      desc = "Toggle Terminal";
    }

    # Telescope Replacement
    {
      mode = ["n" "x"];
      key = "<leader>sw";
      lua = true;
      action = ''
        function()
          Snacks.picker.grep_word()
        end
      '';
      desc = "Visual selection or word";
    }

    {
      mode = "n";
      key = "<leader>sg";
      lua = true;
      action = ''
        function()
          Snacks.picker.grep()
        end
      '';
      desc = "Grep";
    }

    {
      mode = "n";
      key = "<leader>sn";
      lua = true;
      action = ''
        function()
          Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
        end
      '';
      desc = "Find Config File";
    }

    {
      mode = "n";
      key = "<leader>sf";
      lua = true;
      action = ''
        function()
          Snacks.picker.files()
        end
      '';
      desc = "Find Files";
    }

    {
      mode = "n";
      key = "<leader>ss";
      lua = true;
      action = ''
        function()
          Snacks.picker.pickers()
        end
      '';
      desc = "Pick Pickers";
    }

    {
      mode = "n";
      key = "<leader>sh";
      lua = true;
      action = ''
        function()
          Snacks.picker.help()
        end
      '';
      desc = "Search Help Pages";
    }

    {
      mode = "n";
      key = "<leader>sH";
      lua = true;
      action = ''
        function()
          Snacks.picker.highlights()
        end
      '';
      desc = "Highlights";
    }

    {
      mode = "n";
      key = "<leader>sk";
      lua = true;
      action = ''
        function()
          Snacks.picker.keymaps()
        end
      '';
      desc = "Search Keymaps";
    }

    {
      mode = "n";
      key = "<leader>s.";
      lua = true;
      action = ''
        function()
          Snacks.picker.recent()
        end
      '';
      desc = "Recent";
    }

    {
      mode = "n";
      key = "<leader>sc";
      lua = true;
      action = ''
        function()
          Snacks.picker.colorschemes()
        end
      '';
      desc = "Colorschemes";
    }

    {
      mode = "n";
      key = "<leader>sp";
      lua = true;
      action = ''
        function()
          Snacks.picker.projects()
        end
      '';
      desc = "Projects";
    }
  ];
}
