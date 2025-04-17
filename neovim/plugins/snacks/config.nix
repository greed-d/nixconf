{lib, ...}: {
  vim.utility = {
    snacks-nvim = {
      enable = true;
      setupOpts = {
        indent = import ./indent.nix;
        terminal = import ./terminal.nix;

        image.enable = true;
        git.enable = true;
        gitbrowse.enabled = true;
        notifier.enabled = true;
        quickfile.enabled = true;
        scope.enabled = true;
        words.enabled = true;

        scroll.enabled = true;
      };
    };
  };
}
