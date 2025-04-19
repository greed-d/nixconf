_: {
  vim.projects.project-nvim = {
    setupOpts = {
      patterns = [
        ".git"
        "_darcs"
        ".hg"
        ".bzr"
        ".svn"
        "Makefile"
        "package.json"
        "flake.nix"
        "cargo.toml"
        "pyproject.toml"
        "requirements.txt"
      ];
    };
  };
}
