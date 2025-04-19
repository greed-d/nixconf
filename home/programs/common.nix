{
  pkgs,
  inputs,
  ...
}: let
  waybarPrSource = pkgs.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "9556bdabda987acb8bb8959cbfbe1e6f157cccf2";
    sha256 = "sha256-LpPkmAUXJ1ZExnf4SEs/g9juTmS1s2mEvC5hi91/MHE=";
  };

  myWaybarFromPR =
    pkgs.waybar.overrideAttrs (oldAttrs: {src = waybarPrSource;});
in {
  home.packages = with pkgs; [
    # Aesthetic
    myWaybarFromPR
    nitch
    cava
    fastfetch
    gparted
    power-profiles-daemon
    wf-recorder
    font-awesome

    # Explorer
    xfce.thunar
    nautilus

    #Change wallpaper colors
    dipc

    #Image Viewer
    feh

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
    fd

    #Launcher + OSD
    fuzzel
    swayosd

    # Insert emoji easily
    wtype

    #clipboard history
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
    swww

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
    prismlauncher

    #Applications
    vesktop
    inputs.zen-browser.packages."${pkgs.system}".beta
    element-desktop

    gcc
    deno
    nodejs
    rustc
    cargo

    sioyek

    glib
    wayland
    direnv

    nwg-look
    bibata-cursors
    webkitgtk
    tmux

    obsidian
    vesktop
    gnome-keyring
    telegram-desktop
    qbittorrent
    youtube-music
    swaynotificationcenter
  ];

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    # enableFishIntegratoin = true;
  };
  # nixpkgs.overlays = [
  #   (final: prev: {
  #     waybar = prev.waybar.overrideAttrs (oldAttrs: {
  #       src = waybar-pr-src;
  #       version = "${oldAttrs.version}-pr4001";
  #     });
  #   })
  # ];
}
