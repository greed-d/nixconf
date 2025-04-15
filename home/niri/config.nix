{ config, inputs, pkgs, lib, ... }:
let
  pointer = config.home.pointerCursor;
  makeCommand = command: { command = [ command ]; };
in {
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      environment = {
        CLUTTER_BACKEND = "wayland";
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
      };
      spawn-at-startup = [
        (makeCommand
          "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1")
        (makeCommand "hyprlock")
        (makeCommand "swww-daemon")
        (makeCommand "swayosd-server")
      ];
      workspaces = {
        "1" = { };
        "2" = { };
        "3" = { };
        "4" = { };
        "5" = { };
        "6" = { };
        "7" = { };
        "8" = { };
        "8" = { };
        "9" = { };
        "0" = { };
      };
      input = {
        keyboard = { xkb = { }; };
        touchpad = {
          tap = true;
          dwt = true;
          natural-scroll = true;
        };
        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "0%";
        };
      };

      outputs = {
        "eDP-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.096;
          };
          scale = 1.0;
          # transform "normal"
        };
      };

      layout = {
        gaps = 9;
        center-focused-column = "never";

        preset-column-widths = [
          { proportion = 0.25; }
          { proportion = 0.5; }
          { proportion = 0.75; }
          { proportion = 1.0; }
        ];

        preset-window-heights = [
          { proportion = 0.2; }
          { proportion = 0.4; }
          { proportion = 0.5; }
          { proportion = 0.6; }
          { proportion = 0.8; }
        ];

        default-column-width = { proportion = 0.5; };

        focus-ring = {
          enable = true;
          width = 2;
        };

        border = { enable = false; };

        shadow = {
          enable = true;
          softness = 20;
          spread = 7;
          offset = {
            x = -1;
            y = -5;
          };
          color = "#0009";
        };
      };

      prefer-no-csd = true;
    };
  };
}
