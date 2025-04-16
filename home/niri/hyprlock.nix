{ ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      # GENERAL SETTINGS
      general = {
        no_fade_in = true;
        grace = 1;
        disable_loading_bar = false;
        hide_cursor = true;
        ignore_empty_input = true;
        text_trim = true;
      };

      # BACKGROUND SETTINGS
      background = [{
        monitor = "";
        path = "screenshot"; # or a full path fetched via fetchurl if needed
        blur_passes = 2; # $blur = 2 from your config
        contrast = 0.8916;
        brightness = 0.7172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0;
      }];

      # PROFILE PICTURE (IMAGE) SETTINGS
      image = [{
        monitor = "";
        path = "/home/greed/.face"; # make sure this is a global/system path
        size = 90;
        opacity = 0.25;
        shadow_pass = 2; # $shadow-pass = 2
        shadow_size = 3; # $shadow-size = 3
        shadow_color = "rgb(0,0,0)"; # $shadow-color
        shadow_boost = 1.2; # $shadow-boost
        rounding = 12; # $rounding = 12; negative for circle
        border_size = 4;
        rotate = 0;
        position = "20, -35";
        halign = "left";
        valign = "top";
        zindex = 1;
      }];

      # LABELS (for user info, weather, time, etc.)
      label = [
        {
          monitor = "";
          text = ''
            cmd[update:1000] echo -e "greed\n󰁥 $(uname -n)\n\n$(uname -r)\nPackages: $(pacman -Q | wc -l) pacman"'';
          shadow_passes = 1;
          shadow_boost = 0.5;
          color = "rgba(255,255,255,1)"; # using $fg0 = rgba(255,255,255,1)
          font_size = 11;
          font_family = "Google Sans Bold"; # $font-text
          position = "170, -35";
          halign = "left";
          valign = "top";
        }
        {
          monitor = "";
          text =
            ''cmd[update:1000] echo "$(bash /etc/hyprlock/weatherinfo.sh)"'';
          shadow_passes = 1;
          shadow_boost = 0.5;
          color = "rgba(255,255,255,1)";
          font_size = 11;
          font_family = "Google Sans Bold";
          position = "0, -20";
          halign = "center";
          valign = "top";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +\"%H\")"'';
          color = "rgba(255,255,255,1)"; # $clock-color
          shadow_pass = 2; # Using same shadow as above
          shadow_size = 3;
          shadow_color = "rgb(0,0,0)";
          shadow_boost = 1.2;
          font_size = 150;
          font_family = "PP Neue Machina Ultra-Bold"; # $font-display
          position = "0, -155";
          halign = "center";
          valign = "top";
        }
      ];

      # INPUT FIELD SETTINGS
      "input-field" = [{
        monitor = "";
        size = "275, 55"; # width, height as a string
        rounding = 12;
        outline_thickness = 2; # $weight = 2
        outer_color = "rgba(255, 255, 255, 0.15)"; # $border-color
        dots_size = 0.1;
        dots_spacing = 0.2;
        dots_center = true;
        inner_color = "rgba(0, 0, 0, 0.5)"; # $inner-color
        font_color = "rgba(255,255,255,1)"; # $fg0
        fade_on_empty = false;
        font_family = "Google Sans Bold";
        placeholder_text =
          "<span>󰢏  greed</span>"; # using your alias in place of $USER
        hide_input = false;
        position = "0, -240";
        halign = "center";
        valign = "center";
        zindex = 10;
      }];

      # SHAPES (e.g. battery bg, network bg, bluetooth bg, media bg)
      shape = [
        {
          # Battery BG shape
          monitor = "";
          size = "90, 40";
          shadow_passes = 1;
          shadow_boost = 0.5;
          color = "rgba(255,255,255,1)"; # $shape-col0 from your config
          rounding = -1;
          border_size = null;
          border_color = null;
          position = "-20, 20";
          halign = "right";
          valign = "bottom";
          zindex = 1;
        }
        {
          # Network BG shape
          monitor = "";
          size = "150, 40";
          shadow_passes = 1;
          shadow_boost = 0.5;
          color = "rgba(255,255,255,1)"; # $shape-col0
          rounding = -1;
          border_size = null;
          border_color = null;
          position = "20, 20";
          halign = "left";
          valign = "bottom";
          zindex = 1;
        }
        {
          # Bluetooth BG shape
          monitor = "";
          size = "150, 40";
          shadow_passes = 1;
          shadow_boost = 0.5;
          color = "rgba(255,255,255,1)"; # $shape-col0
          rounding = -1;
          border_size = null;
          border_color = null;
          position = "20, 75";
          halign = "left";
          valign = "bottom";
          zindex = 1;
        }
        {
          # Media BG shape
          monitor = "";
          size = "550, 120";
          shadow_passes = 1;
          shadow_boost = 0.5;
          color = "rgba(0, 0, 0, 0.25)"; # $shape-col1
          rounding = 12;
          border_size = null;
          border_color = null;
          position = "0, 70";
          halign = "center";
          valign = "bottom";
          zindex = 1;
        }
      ];

      # Additional configuration entries (such as extra labels for player info, date, etc.)
      # follow the same structure. For instance, to add a label for the date:
      dateLabel = {
        monitor = "eDP-1";
        text =
          "cmd[update:1000] bash -c 'day=$(date +%d); case \"$day\" in 1) suffix=\"st\";; 2) suffix=\"nd\";; 3) suffix=\"rd\";; *) suffix=\"th\";; esac; echo -e \"$(date +\\\"%B %e\\\")$day$suffix, $(date +%Y)\"'";
        shadow_passes = 1;
        shadow_boost = 0.5;
        color = "rgba(255,255,255,1)";
        font_size = 14;
        font_family = "Google Sans Bold";
        position = "0, -115";
        halign = "center";
        valign = "center";
      };

      # You can then add this entry into a list or merge it with the "label" key if desired.
    };
  };
}
