{ ... } : { 
  vim.formatter = {
    conform-nvim = {
      enable = true; 
      setupOpts = {
        nix = [ "alejandra" ];
      };
    }; 
  }; 
}
