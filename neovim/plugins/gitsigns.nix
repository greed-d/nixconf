{...}: {
  vim.git.gitsigns = {
    enable = true;
    mappings = {
      blameLine = "<leader>gb";
      diffProject = "<leader>gD";
      diffThis = "<leader>gd";
      resetBuffer = "<leader>gR";
      stageBuffer = "<leader>gS";
      stageHunk = "<leader>gs";
    };
    setupOpts = {
      signs = {
        add = {text = "│";};
        change = {text = "│";};
        delete = {text = "󰍵";};
        topdelete = {text = "‾";};
        changedelete = {text = "~";};
        untracked = {text = "│";};
      };
      current_line_blame_opts = {
        virt_text = true;
        virt_text_pos = "eol";
        delay = 300;
        ignore_whitespace = false;
        virt_text_priority = 100;
        use_focus = true;
      };
    };
  };
}
