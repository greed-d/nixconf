{pkgs, ...}: {
  vim.formatter = {
    conform-nvim = {
      enable = true;
      setupOpts = {
        formatters = {
          alejandra = {
            command = "${pkgs.alejandra}/bin/alejandra";
          };
        };
        formatter_by_ft = {
          nix = ["alejandra"];
          python = ["ruff"];
        };
        format_on_save = {
          lsp_format = "fallback";
          timeout_ms = 500;
        };
      };
    };
  };
}
