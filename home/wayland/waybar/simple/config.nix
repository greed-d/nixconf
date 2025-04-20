{pkgs, ...}: {
  programs.waybar = {
    settings = [
      {
        "layer" = "top";
        "height" = 45;
        "modules-left" = ["niri/window" "cpu" "memory" "niri/workspaces"];
        "modules-center" = ["mpris"];
        "modules-right" = ["tray" "pulseaudio" "backlight" "battery" "custom/lock" "clock" "custom/weather"];

        "niri/workspaces" = {
          "format" = "{name}";

          "display-condition" = "only-populated";
          "on-click" = "activate";
          "format-icons" = {
            "active" = "󰮯";
            "default" = "󰊠";
          };
        };

        "niri/window" = {
          "format" = "{app_id}";
          "min-length" = 5;
          "max-length" = 20;

          "rewrite" = {
            "" = "<span foreground='#8aadf4'> </span> Hyprland";

            "com.mitchellh.ghostty" = "   Ghostty";

            "(.*)Mozilla Firefox" = "<span foreground='#ed8796'>󰈹 </span> Firefox";
            "(.*) — Mozilla Firefox" = "<span foreground='#ed8796'>󰈹 </span> $1";

            "(.*)Zen Browser" = "<span foreground='#f5a97f'>󰺕 </span> Zen Browser";
            "(.*) — Zen Browser" = "<span foreground='#f5a97f'>󰺕 </span> Zen Browser";
            "zen-beta" = "<span foreground='#f5a97f'>󰺕 </span> Zen Browser";

            "(.*) - Visual Studio Code" = "<span foreground='#8aadf4'>󰨞  </span> $1";
            "(.*)Visual Studio Code" = "<span foreground='#8aadf4'>󰨞  </span> Visual Studio Code";

            "nvim" = "<span foreground='#a6da95'>  </span> Neovim";
            "nvim (.*)" = "<span foreground='#a6da95'>  </span> Neovim";

            "vim" = "<span foreground='#a6da95'>  </span> Vim";
            "vim (.*)" = "<span foreground='#a6da95'>  </span> $1";

            "Element" = "<span foreground='#a6da95'>󰹻  </span> Element";

            #MEdia
            "(.*)Spotify" = "<span foreground='#a6da95'>  </span> Spotify";
            "(.*)Spotify Premium" = "<span foreground='#a6da95'>  </span> Spotify Premium";

            "VLC media player" = "<span foreground='#f5a97f'>󰕼  </span> VLC Media Player";
            "(.*) - VLC media player" = "<span foreground='#f5a97f'>󰕼  </span> $1";

            "(.*) - mpv" = "<span foreground='#c6a0f6'>  </span> mpv";
            "mpv" = "<span foreground='#c6a0f6'>  </span> mpv";

            "thunar" = "<span foreground='#8aadf4'>󰉋  </span> Thunar";
            "obsidian" = "<span foreground='#5b4965'>󱞁  </span> Obsidian";
            "com.github.th_ch.youtube_music" = "<span foreground='#FF0000'>  </span> YT Music";

            "qView" = "  qView";

            "(.*).jpg" = "  $1.jpg";
            "(.*).png" = "  $1.png";
            "(.*).svg" = "  $1.svg";

            # Social

            "vesktop" = "<span foreground='#8aadf4'>   </span> Discord";

            "• Discord(.*)" = "Discord$1";
            "(.*)Discord(.*)" = "<span foreground='#8aadf4'>  </span> Discord";

            "Telegram (.*)" = "<span foreground='#24A1DE'>  </span> Telegram";
            "org.telegram.desktop" = "<span foreground='#24A1DE'>  </span> Telegram";

            # Documents

            "ONLYOFFICE Desktop Editors" = "<span foreground='#ed8796'> </span> OnlyOffice Desktop";

            "(.*).docx" = "<span foreground='#8aadf4'> </span> $1.docx";
            "(.*).xlsx" = "<span foreground='#a6da95'> </span> $1.xlsx";
            "(.*).pptx" = "<span foreground='#f5a97f'> </span> $1.pptx";
            "(.*).pdf" = "<span foreground='#ed8796'> </span> $1.pdf";

            # System
            "Authenticate" = "  Authenticate";
          };
        };

        "tray" = {
          "spacing" = 10;
        };

        "clock" = {
          "format" = "   {:%H:%M}";
          "format-alt" = "{:%b %d %Y}";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "mpris" = {
          format = "{player_icon}  {title}";
          format-paused = "{player_icon} - {status_icon}  {title}";
          artist-len = 10;
          title-len = 20;
          player-icons = {
            default = "▶";
            mpv = "🎵";
            spotify = " ";
            firefox = " ";
            chromium = "  ";
          };
          status-icons = {paused = " ";};
        };
        "cpu" = {
          "interval" = 10;
          "format" = "   {}%";
          "max-length" = 10;
          "on-click" = "";
        };

        memory = {
          "interval" = 30;
          "format" = "   {}%";
          "format-alt" = " {used:0.1f}GB";
          "max-length" = 10;
        };

        backlight = {
          "device" = "eDP-1";
          "format" = "{icon}";
          "tooltip-format" = "{percent}";
          "format-icons" = ["󱩎 " "󱩏 " "󱩐 " "󱩑 " "󱩒 " "󱩓 " "󱩔 " "󱩕 " "󱩖 " "󰛨 "];
          "on-scroll-up" = "swayosd-client --brightness +1";
          "on-scroll-down" = "swayosd-client --brightness -1";
        };

        network = {
          "format-wifi" = "{icon}";
          "format-ethernet" = " ";
          "format-disconnected" = "󰤮 ";
          "tooltip-format" = "{essid}";
          "on-click" = "${pkgs.bash}/bin/bash ~/.config/waybar/scripts/network/rofi-network-manager.sh";
          "format-icons" = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        };

        "pulseaudio" = {
          format = "{icon}";
          "format-muted" = " ";
          "format-icons" = {
            "default" = ["" " " " "];
          };
          "on-click-middle" = "${pkgs.pavucontrol}/bin/pavucontrol &";
          "on-click" = "swayosd-client --output-volume mute-toggle";
          "on-scroll-up" = "swayosd-client --output-volume +1";
          "on-scroll-down" = "swayosd-client --output-volume -1";
	  "tooltip-format" = "{volume}%";
        };

        battery = {
          "bat" = "BAT1";
          "adapter" = "ACAD";
          "interval" = 60;
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "max-length" = 20;
          "format" = "{icon} ";
          "format-warning" = "{icon}";
          "format-critical" = "{icon}";
          "format-charging" = "<span font-family='Font Awesome 6 Free'></span>";
          "format-plugged" = "󱐋 ";
          "tooltip-format" = "{capacity}%";
          "format-alt" = "{icon} {time}";
          "format-full" = " ";
          "format-icons" = ["󱊡" "󱊢" "󱊣"];
        };

        "custom/weather" = {
          exec = "python3 ~/.config/waybar/scripts/weather.py";
          "restart-interval" = 300;
          "return-type" = "json";
        };

        "custom/lock" = {
          "tooltip" = false;
          "on-click" = "${pkgs.hyprlock}/bin/hyprlock";
          "format" = "";
        };

        "custom/spotify" = {
          "exec" = "${pkgs.python3}/bin/python3 ~/.config/waybar/scripts/mediaplayer.py --player spotify";
          "format" = " {}";
          "return-type" = "json";
          "on-click" = "${pkgs.playerctl}/bin/playerctl play-pause";
          "on-double-click-right" = "${pkgs.playerctl}/bin/playerctl next";
          "on-scroll-down" = "${pkgs.playerctl}/bin/playerctl previous";
        };

        "custom/power-menu" = {
          "format" = " ⏻ ";
          "on-click" = "${pkgs.bash}/bin/bash ~/.config/waybar/scripts/power-menu/powermenu.sh &";
        };

        "custom/launcher" = {
          "format" = "";
          "on-click" = "${pkgs.rofi}/bin/rofi -show drun &";
        };
      }
    ];
  };
}
