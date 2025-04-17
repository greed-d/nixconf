{...}: {
  vim.git.gitsigns = {
    enable = true;
    mappings = {
      blameLine = "<leader>gb";
      diffProject = "<leader>gD";
      diffThis = "<leader>gd";
      resetBuffer = "<leader>gR";
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
    };
  };
}
