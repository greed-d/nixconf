{...}: {
  vim.autocomplete.blink-cmp = {
    enable = true;
    mappings = {
      confirm = "<C-y>";
      next = "<C-n>";
      previous = "<C-p>";
      scrollDocsUp = "<C-b>";
      scrollDocsDown = "<C-f>";
    };
    friendly-snippets.enable = true;
    sourcePlugins = {
      ripgrep.package.enable = true;
    };
    # setupOpts = ;
  };
}
