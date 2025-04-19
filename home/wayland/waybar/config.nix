_: {
  programs.waybar = {
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
          "niri/workspaces"
          "custom/sep"
          "tray"
          "custom/sep"
          "power-profiles-daemon"
          "custom/sep"
        ];
        modules-center = [
          "cpu"
          "custom/sep"
          "mpris"
          "custom/sep"
          "memory"
        ];
        modules-right = [
          "custom/sep"
          "pulseaudio"
          "pulseaudio#microphone"
          "backlight"
          "custom/sep"
          "battery"
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
          format-icons = ["" "" "" "" "" "" "" "" ""];
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
          format-icons = ["" "" "" "" ""];
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
          status-icons = {paused = " ";};
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

            "(.*)Mozilla Firefox" = "<span foreground='#ed8796'>󰈹 </span> Firefox";
            "(.*) — Mozilla Firefox" = "<span foreground='#ed8796'>󰈹 </span> $1";

            "(.*)Zen Browser" = "<span foreground='#f5a97f'>󰺕  </span> Zen Browser";
            "(.*) — Zen Browser" = "<span foreground='#f5a97f'>󰺕  </span> Zen Browser";
            "zen-beta" = "<span foreground='#f5a97f'>󰺕  </span> Zen Browser";

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
          actions = {on-click-right = "mode";};
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
            default = [" " " " " "];
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
  };
}
