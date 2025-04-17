{ pkgs, lib, ... }: { 
        vim = { 
                statusline.lualine = {
                        enable = true; 
                        setupOpts = {
                                dependencies = [];
                        };

                }; 
        };
}

