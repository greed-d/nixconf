_: {
  vim = {
    lsp.formatOnSave = true;
    languages = {
      enableLSP = true;
      enableTreesitter = true;
      nix = import ./nix.nix;
      python = import ./python.nix;
    };
    lsp.mappings = {
      goToDeclaration = "gD";
      goToDefinition = "gd";
      goToType = "gy";
      nextDiagnostic = "]d";
      previousDiagnostic = "[d";
      listImplementations = "gI";
      listReferences = "gr";
    };
    diagnostics = {
      enable = true;
      config = {
        signs = {
          text = [
            "󰅚 "
            "󰀪 "
            " "
            "󰛩 "
          ];
        };
        virtual_text = true;
      };
    };
  };
}
