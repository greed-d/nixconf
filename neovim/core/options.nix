{ ... } : {
  vim = {
    useSystemClipboard = true;
    options = {
      mouse = "a";
      showmode = false;
      shiftwidth = 2;
      tabstop = 2;
      smartindent = true;
      expandtab = true;
      softtabstop = 2;
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      cursorline = true;
      inccommand = "split";
      scrolloff = 21;
      confirm = true;
    };
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
  };
}
