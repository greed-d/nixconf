{ ... } : {
  imports = [ ./nix.nix ];
  vim = {
    languages = {
      enableLSP = true;
      enableTreesitter = true;
    };
  };

}
