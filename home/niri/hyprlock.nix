{...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      # BACKGROUND block becomes a list (in case you ever want multiple backgrounds)
      background = [
        {
          monitor = "";
          path = "screenshot";
          blur_passes = 2;
          contrast = 0.9;
          brightness = 0.9;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      # GENERAL block as a record
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
        ignore_empty_input = true;
      };

      # INPUT FIELD block – note the key name is quoted because it includes a hyphen
      "input-field" = {
        monitor = "";
        size = "250, 60"; # using a string to represent the two numbers
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.5)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = false;
        font_family = "JetBrains Mono Nerd Font Mono";
        placeholder_text = ''<i><span foreground="##cdd6f4">Password?....</span></i>'';
        hide_input = false;
        position = "0, -160";
        halign = "center";
        valign = "center";
      };

      # LABEL blocks are collected into a list. Each record here corresponds to one label.
      label = [
        {
          # TIME label
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%-I:%M%p")"'';
          color = "$foreground"; # assuming $foreground is provided by your environment
          font_size = 90;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "0, -475";
          halign = "center";
          valign = "top";
        }
        {
          # USER label
          monitor = "";
          text = "Hi there, $USER";
          color = "$foreground";
          font_size = 20;
          font_family = "JetBrains Mono Nerd Font Mono";
          position = "0, -95";
          halign = "center";
          valign = "center";
        }
      ];

      # IMAGE blocks are collected into a list.
      image = [
        {
          # Primary image block
          monitor = "";
          path = "/home/greed/.face";
          size = 150;
          rounding = -1; # negative for circular image
          border_size = 4;
          border_color = "rgb(221, 221, 221)";
          rotate = 0;
          reload_time = -1;
          reload_cmd = "";
          position = "0, 150";
          halign = "center";
          valign = "center";
        }
        {
          # Music Album Art image block
          monitor = "";
          path = "$mpris_art"; # will use the value from the top-level key
          size = 80;
          rounding = 5;
          rotate = 0;
          reload_time = 0;
          reload_cmd = "";
          position = "-130, -310";
          halign = "center";
          valign = "center";
          zindex = 5;
        }
      ];
    };
  };
}
