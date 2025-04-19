{pkgs, ...}: {
  programs.waybar = {
    settings = [
      {
        layer = "top";
        height = 40;
        "modules-left" = ["custom/launcher" "cpu" "memory" "wlr/workspaces" "custom/weather"];
        "modules-right" = ["tray" "network" "pulseaudio" "backlight" "battery" "custom/lock" "clock" "custom/power-menu"];

        "wlr/workspaces" = {
          format = "{icon}";
          "on-click" = "activate";
          "format-icons" = {
            active = "󰮯";
            default = "";
          };
        };

        "hyprland/window" = {
          format = "{}";
        };

        tray = {
          spacing = 10;
        };

        clock = {
          format = "{:%H:%M}";
          "format-alt" = "{:%b %d %Y}";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        cpu = {
          interval = 10;
          format = " {}%";
          "max-length" = 10;
          "on-click" = "";
        };

        memory = {
          interval = 30;
          format = " {}%";
          "format-alt" = " {used:0.1f}GB";
          "max-length" = 10;
        };

        backlight = {
          device = "eDP-1";
          format = "{icon}";
          "tooltip-format" = "{percent}";
          "format-icons" = ["󱩎 " "󱩏 " "󱩐 " "󱩑 " "󱩒 " "󱩓 " "󱩔 " "󱩕 " "󱩖 " "󰛨 "];
        };

        network = {
          "format-wifi" = "{icon}";
          "format-ethernet" = " ";
          "format-disconnected" = "睊";
          "tooltip-format" = "{essid}";
          "on-click" = "${pkgs.bash}/bin/bash ~/.config/waybar/scripts/network/rofi-network-manager.sh";
          "format-icons" = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        };

        pulseaudio = {
          format = "{icon}";
          "format-muted" = "婢";
          "format-icons" = {
            default = ["" "" "墳"];
          };
          "on-click" = "${pkgs.pavucontrol}/bin/pavucontrol &";
        };

        battery = {
          bat = "BAT0";
          adapter = "ADP0";
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          "max-length" = 20;
          format = "{icon} ";
          "format-warning" = "{icon}";
          "format-critical" = "{icon}";
          "format-charging" = "<span font-family='Font Awesome 6 Free'></span>";
          "format-plugged" = "ﮣ";
          "format-alt" = "{icon} {time}";
          "format-full" = "ﮣ";
          "format-icons" = ["󱊡" "󱊢" "󱊣"];
        };

        "custom/weather" = {
          exec = "${pkgs.python3}/bin/python3 ~/.config/waybar/scripts/weather.py";
          "restart-interval" = 300;
          "return-type" = "json";
        };

        "custom/lock" = {
          tooltip = false;
          "on-click" = "${pkgs.swaylock}/bin/swaylock";
          format = "";
        };

        "custom/spotify" = {
          exec = "${pkgs.python3}/bin/python3 ~/.config/waybar/scripts/mediaplayer.py --player spotify";
          format = " {}";
          "return-type" = "json";
          "on-click" = "${pkgs.playerctl}/bin/playerctl play-pause";
          "on-double-click-right" = "${pkgs.playerctl}/bin/playerctl next";
          "on-scroll-down" = "${pkgs.playerctl}/bin/playerctl previous";
        };

        "custom/power-menu" = {
          format = " ⏻ ";
          "on-click" = "${pkgs.bash}/bin/bash ~/.config/waybar/scripts/power-menu/powermenu.sh &";
        };

        "custom/launcher" = {
          format = "";
          "on-click" = "${pkgs.rofi}/bin/rofi -show drun &";
        };
      }
    ];
  };
}
