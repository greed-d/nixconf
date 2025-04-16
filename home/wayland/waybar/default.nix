{ pkgs, ... }:
let
  waybarPrSource = pkgs.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "9556bdabda987acb8bb8959cbfbe1e6f157cccf2";
    sha256 = "sha256-LpPkmAUXJ1ZExnf4SEs/g9juTmS1s2mEvC5hi91/MHE=";
  };

  myWaybarFromPR =
    pkgs.waybar.overrideAttrs (oldAttrs: { src = waybarPrSource; });
in {
  imports = [ ./style.nix ];
  programs.waybar = {
    package = myWaybarFromPR;
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;
        spacing = 4;
        exclusive = true;
        passthrough = false;
        fixed-center = true;

        modules-left = [
          "niri/window"
          "custom/sep"
          "mpris"
          "custom/sep"
          "tray"
          "custom/sep"
          "cpu"
          "power-profiles-daemon"
          "custom/update"
          "custom/sep"
        ];
        modules-center = [ "niri/workspaces" ];
        modules-right = [
          "custom/sep"
          "pulseaudio"
          "pulseaudio#microphone"
          "backlight"
          "custom/sep"
          "battery"
          "memory"
          "custom/sep"
          "clock"
          "custom/sep"
          "idle_inhibitor"
          "custom/power"
        ];

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        "backlight" = {
          format = "{icon}  {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
          tooltip = false;
          on-scroll-up = "swayosd-client --brightness +5";
          on-scroll-down = "swayosd-client --brightness -5";
          max-length = 6;
        };

        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = ''
            Power profile: {profile}
            Driver: {driver}'';
          tooltip = true;
          format-icons = {
            default = " ";
            performance = " ";
            balanced = " ";
            power-saver = " ";
          };
        };

        "battery" = {
          interval = 60;
          align = 0;
          rotate = 0;
          full-at = 100;
          design-capacity = false;
          states = {
            good = 95;
            warning = 30;
            critical = 10;
          };
          format = "{icon}   {capacity}%";
          format-charging = "  {capacity}%";
          format-plugged = "  {capacity}%";
          format-full = "{icon}   Full";
          format-alt = "{icon} {time}";
          format-icons = [ "" "" "" "" "" ];
          format-time = "{H}h {M}min";
          tooltip = true;
          tooltip-format = " {timeTo} {power}w ";
          on-click-middle = "~/.config/hypr/scripts/ChangeBlur.sh";
          on-click-right = "$HOME/.config/hypr/scripts/WofiPower.sh";
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
          status-icons = { paused = " "; };
        };

        "niri/workspaces" = {
          on-click = "activate";
          format = "{name}";
          # format-icons = {
          #   "1": "󰺕 ",
          #   "2": "󰄛 ",
          #   "3": " ",
          #   "4": " ",
          #   "5": " ",
          #   "6": "󰉋 ",
          #   "7": " ",
          #   "8": "󰓇 ",
          #   "9": "󰙯 ",
          #   "10": " ",
          # },
          all-outputs = false;
          disable-scroll = false;
          active-only = false;
          display-condition = "only-populated";
          min-length = 10;
        };

        "niri/window" = {
          format = "{app_id}";
          min-length = 5;
          max-length = 20;

          "rewrite" = {
            "" = "<span foreground='#8aadf4'> </span> Hyprland";

            "com.mitchellh.ghostty" = "   Ghostty";

            "(.*)Mozilla Firefox" =
              "<span foreground='#ed8796'>󰈹 </span> Firefox";
            "(.*) — Mozilla Firefox" =
              "<span foreground='#ed8796'>󰈹 </span> $1";

            "(.*)Zen Browser" =
              "<span foreground='#f5a97f'>󰺕  </span> Zen Browser";
            "(.*) — Zen Browser" =
              "<span foreground='#f5a97f'>󰺕  </span> Zen Browser";
            "zen-beta" = "<span foreground='#f5a97f'>󰺕  </span> Zen Browser";

            "(.*) - Visual Studio Code" =
              "<span foreground='#8aadf4'>󰨞  </span> $1";
            "(.*)Visual Studio Code" =
              "<span foreground='#8aadf4'>󰨞  </span> Visual Studio Code";

            "nvim" = "<span foreground='#a6da95'>  </span> Neovim";
            "nvim (.*)" = "<span foreground='#a6da95'>  </span> Neovim";

            "vim" = "<span foreground='#a6da95'>  </span> Vim";
            "vim (.*)" = "<span foreground='#a6da95'>  </span> $1";

            "Element" = "<span foreground='#a6da95'>󰹻  </span> Element";

            #MEdia
            "(.*)Spotify" = "<span foreground='#a6da95'>  </span> Spotify";
            "(.*)Spotify Premium" =
              "<span foreground='#a6da95'>  </span> Spotify Premium";

            "VLC media player" =
              "<span foreground='#f5a97f'>󰕼  </span> VLC Media Player";
            "(.*) - VLC media player" =
              "<span foreground='#f5a97f'>󰕼  </span> $1";

            "(.*) - mpv" = "<span foreground='#c6a0f6'>  </span> mpv";
            "mpv" = "<span foreground='#c6a0f6'>  </span> mpv";

            "thunar" = "<span foreground='#8aadf4'>󰉋  </span> Thunar";
            "obsidian" = "<span foreground='#5b4965'>󱞁  </span> Obsidian";
            "com.github.th_ch.youtube_music" =
              "<span foreground='#FF0000'>  </span> YT Music";

            "qView" = "  qView";

            "(.*).jpg" = "  $1.jpg";
            "(.*).png" = "  $1.png";
            "(.*).svg" = "  $1.svg";

            # Social

            "vesktop" = "<span foreground='#8aadf4'>   </span> Discord";

            "• Discord(.*)" = "Discord$1";
            "(.*)Discord(.*)" = "<span foreground='#8aadf4'>  </span> Discord";

            "Telegram (.*)" = "<span foreground='#24A1DE'>  </span> Telegram";
            "org.telegram.desktop" =
              "<span foreground='#24A1DE'>  </span> Telegram";

            # Documents

            "ONLYOFFICE Desktop Editors" =
              "<span foreground='#ed8796'> </span> OnlyOffice Desktop";

            "(.*).docx" = "<span foreground='#8aadf4'> </span> $1.docx";
            "(.*).xlsx" = "<span foreground='#a6da95'> </span> $1.xlsx";
            "(.*).pptx" = "<span foreground='#f5a97f'> </span> $1.pptx";
            "(.*).pdf" = "<span foreground='#ed8796'> </span> $1.pdf";

            # System
            "Authenticate" = "  Authenticate";
          };
        };

        "custom/update" = {
          exec = "~/.config/waybar/modules/system-update.sh";
          return-type = "json";
          format = "{}";
          on-click = "~/.config/waybar/modules/system-update.sh up";
          interval = 30;
          min-length = 1;
          max-length = 1;
        };

        "tray" = {
          show-passive-items = true;
          spacing = 10;
        };

        "clock" = {
          format = "   {:%H:%M:%S}";
          format-alt = "   {:%a, %d %b}";
          interval = 1;
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            on-click-right = "mode";
            format = {
              months = "<span color='#f5e0dc'><b>{}</b></span>";
              weekdays = "<span color='#f9e2af'><b>{}</b></span>";
              today = "<span color='#f38ba8'><b>{}</b></span>";
            };
          };
          actions = { on-click-right = "mode"; };
          min-length = 8;
          max-length = 28;
        };

        "pulseaudio" = {
          format = "{icon}   {volume}%";
          format-muted = "  muted";
          format-icons = {
            headphone = " ";
            hands-free = "󰂑";
            headset = "󰂑";
            phone = "";
            portable = "";
            car = "";
            default = [ " " " " " " ];
          };
          on-click-middle = "pavucontrol";
          on-click = "swayosd-client --output-volume mute-toggle";
          on-scroll-up = "swayosd-client --output-volume +1";
          on-scroll-down = "swayosd-client --output-volume -1";
        };

        "cpu" = {
          format = "󰍛  {usage}%";
          tooltip = false;
          interval = 5;
        };

        "memory" = {
          states = {
            warning = 75;
            critical = 90;
          };

          format = "   {percentage}%";
          format-critical = "󰀦 {percentage}%";
          tooltip-format = "Memory Used: {used:0.1f} GB / {total:0.1f} GB";
          interval = 5;
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = "  {volume}%";
          format-source-muted = " ";
          on-click = "swayosd-client --input-volume mute-toggle";
          on-click-middle = "";
          on-scroll-up = "swayosd-client --input-volume +1";
          on-scroll-down = "swayosd-client --input-volume -1";
          tooltip-format = "{source_desc} | {source_volume}%";
        };

        "custom/sep" = {
          format = "|";
          tooltip = false;
        };

        "custom/power" = {
          tooltip = false;
          on-click = "swaync-client -t -sw";
          format = "󰂚 ";
        };
      };
    };
    # style = ''
    #
    #   * {
    #     min-height: 0;
    #     font-family: Lexend;
    #     font-size: 14px;
    #     font-weight: 500;
    #   }
    #
    #   window#waybar {
    #     transition-property: background-color;
    #     transition-duration: 0.5s;
    #     /* background-color: #1e1e2e; */
    #     /* background-color: #181825; */
    #     background-color: rgba(24, 24, 37, 0.8);
    #   }
    #
    #   window#waybar.hidden {
    #     opacity: 0.5;
    #   }
    #
    #   #workspaces {
    #     background-color: transparent;
    #   }
    #
    #   #workspaces button {
    #     all: initial;
    #     min-width: 0;
    #     box-shadow: inset 0 -3px transparent;
    #     padding: 2px 10px;
    #     min-height: 0;
    #     margin: 4px 4px;
    #     border-radius: 8px;
    #     background-color: #181825;
    #     color: #cdd6f4;
    #   }
    #
    #   #workspaces button:hover {
    #     box-shadow: inherit;
    #     text-shadow: inherit;
    #     color: #1e1e2e;
    #     background-color: #cdd6f4;
    #   }
    #
    #   #workspaces button.active {
    #     color: #1e1e2e;
    #     background-color: #89b4fa;
    #   }
    #
    #   #workspaces button.urgent {
    #     background-color: #f38ba8;
    #   }
    #
    #   #clock,
    #   #power-profiles-daemon,
    #   #idle_inhibitor,
    #   #pulseaudio,
    #   #custom-logo,
    #   #custom-power,
    #   #custom-music-player,
    #   #custom-update,
    #   #mpris,
    #   #battery,
    #   #cpu,
    #   #backlight,
    #   #tray,
    #   #memory,
    #   #window,
    #   #custom-screen-recorder,
    #   #custom-gpu {
    #     min-height: 0;
    #     padding: 2px 10px;
    #     border-radius: 8px;
    #     margin: 4px 4px;
    #     background-color: #181825;
    #   }
    #
    #   #backlight{
    #     color: #f9e2af;
    #   }
    #   #custom-sep {
    #     padding: 0px;
    #     color: #585b70;
    #   }
    #
    #   #custom-screen-recorder.recording {
    #     color: #10ef2c;
    #   }
    #
    #   #custom-screen-recorder.not-recording {
    #     color: #df2020;
    #   }
    #
    #   #custom-music-player.playing {
    #     color: #cdd6f4;
    #   }
    #
    #   #custom-music-player.paused {
    #     color: #9399b2;
    #   }
    #
    #   window#waybar.empty #window {
    #     background-color: transparent;
    #   }
    #
    #   #cpu {
    #     color: #94e2d5;
    #     margin-left: 0;
    #     margin-right: 0;
    #   }
    #
    #   #custom-gpu {
    #     color: #94e2d5;
    #     margin-left: 0;
    #     margin-right: 0;
    #   }
    #
    #   #memory {
    #     margin-left: 0;
    #     color: #cba6f7;
    #   }
    #
    #   #clock {
    #     color: #74c7ec;
    #   }
    #
    #   #clock.simpleclock {
    #     color: #89b4fa;
    #   }
    #
    #   #window {
    #     color: #b4befe
    #   }
    #
    #   #pulseaudio {
    #     color: #b4befe;
    #   }
    #
    #   #pulseaudio.muted {
    #     color: #a6adc8;
    #   }
    #
    #   #custom-logo {
    #     color: #89b4fa;
    #   }
    #
    #   #custom-power {
    #     color: #f38ba8;
    #     padding-right: 5px;
    #     font-size: 14px;
    #   }
    #
    #   @keyframes blink {
    #     to {
    #       background-color: #f38ba8;
    #       color: #181825;
    #     }
    #   }
    #
    #   tooltip {
    #     border-radius: 8px;
    #   }
    #
    #   #tray menu {
    #     background: rgb(24, 24, 37);
    #     color: white;
    #   }
    #
    #   #battery {
    #     color: #a6e3a1;
    #
    #     /* background-color: @catp; */
    #     /* margin-top: 7px; */
    #     /* margin-bottom: 7px; */
    #     /* border-radius: 10px; */
    #   }
    #
    #   @keyframes blink {
    #     to {
    #       background-color: #ffffff;
    #       color: #000000;
    #     }
    #   }
    #
    #   #battery.critical:not(.connected) {
    #     background-color: #f53c3c;
    #     color: #ffffff;
    #     animation-name: blink;
    #     animation-duration: 0.5s;
    #     animation-timing-function: linear;
    #     animation-iteration-count: infinite;
    #     animation-direction: alternate;
    #   }
    # '';
  };
}
