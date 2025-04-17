{...}: {
  vim.tabline.nvimBufferline = {
    enable = true;
    mappings = {
      closeCurrent = "<leader>bk";
      cycleNext = "]b";
      cyclePrevious = "[b";
    };
    setupOpts = {
      options.separator_style = "padded_slant";
    };
  };
}
