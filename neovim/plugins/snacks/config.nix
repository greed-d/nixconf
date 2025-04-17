{lib, ...}: {
  vim.utility = {
    snacks-nvim = {
      enable = true;
      setupOpts = {
        indent = import ./indent.nix;
      };
    };
  };
}
