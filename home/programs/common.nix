{ lib, pkgs, config, inputs, ... }: {
  home.packages = with pkgs; [
    # Aesthetic
    nitch
    cava
    fastfetch
    gparted

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    fuzzel
    swayosd
    waybar
    wtype
    cliphist

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses

    # misc
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity

    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    #Applications
    vesktop
    inputs.zen-browser.packages."${pkgs.system}".beta
    element-desktop

    steam

    gcc
    deno
    nodejs
    rustc
    cargo
    nixfmt-rfc-style

    firefox
    sioyek

    glib
    acpilight
    wayland
    direnv
    gnome-software

    lazygit
    nwg-look
    bibata-cursors
    grimblast
    swappy
    webkitgtk
    tmux

    cliphist
    wf-recorder
    obsidian
    vesktop
    gnome-keyring
    telegram-desktop
    qbittorrent

  ];

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    # enableFishIntegratoin = true;
  };

}
