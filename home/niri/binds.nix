{
  config,
  inputs,
  pkgs,
  ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    set-volume = spawn "swayosd-client" "--output-volume";
    brightness = spawn "swayosd-client" "--brightness";
  in {
    # Special Keys
    "XF86AudioMute".action =
      spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
    "XF86AudioMicMute".action =
      spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
    "XF86AudioRaiseVolume".action = set-volume "+5";
    "XF86AudioLowerVolume".action = set-volume "-5";

    "XF86MonBrightnessUp".action = brightness "+5;";
    "XF86MonBrightnessDown".action = brightness "+5";

    # Screenshot
    "Print".action.screenshot-screen = {write-to-disk = true;};
    "Mod+Alt+S".action.screenshot-screen = {};
    "Mod+Shift+S".action.screenshot = {};

    # Misc Stuff
    "Mod+Shift+Slash".action = show-hotkey-overlay;

    #Power Stuff
    "Mod+Shift+Q".action = spawn "bash" "-c" "shutdown" "now";
    # "Mod+Ctrl+Q".action = quit; # This errors
    "Mod+W".action.close-window = [];
    # "Mod+Alt+P".action = power-off-monitors; # This errors

    # Program Bindings

    "Mod+Return".action.spawn = "ghostty";
    "Mod+Space".action = spawn "bash" "-c" "pkill fuzzel || fuzzel";
    "Super+Ctrl+L".action = spawn "sh -c pgrep hyprlock || hyprlock";
    "Mod+B".action = spawn "zen-beta"; # This errors
    "Mod+E".action.spawn = "thunar";
    "Mod+D".action.spawn = "vesktop";
    "Mod+T".action.spawn = "telegram-desktop";
    # "Mod+M".action = spawn "youtube-music";
    # "Mod+slash".action = spawn "fuzzel-emoji";
    "Mod+Shift+M".action =
      spawn "swayosd-client" "--input-volume" "mute-toggle";
    "Mod+V".action =
      spawn "bash" "-c"
      "pkill fuzzel || cliphist list | fuzzel  --match-mode fzf --dmenu --anchor center --lines 15 --width 80 | cliphist decode | wl-copy";

    "Mod+H".action.focus-column-left = [];
    "Mod+J".action.focus-window-down = [];
    "Mod+K".action.focus-window-up = [];
    "Mod+L".action.focus-column-right = [];

    "Mod+Ctrl+Left".action.move-column-left = [];
    "Mod+Ctrl+Down".action.move-window-down = [];
    "Mod+Ctrl+Up".action.move-window-up = [];
    "Mod+Ctrl+Right".action.move-column-right = [];
    "Mod+Shift+H".action.move-column-left = [];
    "Mod+Shift+J".action.move-window-down = [];
    "Mod+Shift+K".action.move-window-up = [];
    "Mod+Shift+L".action.move-column-right = [];

    "Mod+P".action.focus-column-first = [];
    "Mod+N".action.focus-column-last = [];
    "Mod+Shift+P".action.move-column-to-first = [];
    "Mod+Shift+N".action.move-column-to-last = [];

    "Mod+Shift+Left".action.focus-monitor-left = [];
    "Mod+Shift+Down".action.focus-monitor-down = [];
    "Mod+Shift+Up".action.focus-monitor-up = [];
    "Mod+Shift+Right".action.focus-monitor-right = [];
    "Mod+Ctrl+H".action.focus-monitor-left = [];
    "Mod+Ctrl+J".action.focus-monitor-down = [];
    "Mod+Ctrl+K".action.focus-monitor-up = [];
    "Mod+Ctrl+L".action.focus-monitor-right = [];

    "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [];
    "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = [];
    "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = [];
    "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [];
    "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = [];
    "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = [];
    "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = [];
    "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = [];

    "Mod+U".action.focus-workspace-down = [];
    "Mod+I".action.focus-workspace-up = [];
    "Mod+Ctrl+U".action.move-column-to-workspace-down = [];
    "Mod+Ctrl+I".action.move-column-to-workspace-up = [];

    "Mod+Shift+U".action.move-workspace-down = [];
    "Mod+Shift+I".action.move-workspace-up = [];

    "Mod+1".action.focus-workspace = "1";
    "Mod+2".action.focus-workspace = "2";
    "Mod+3".action.focus-workspace = "3";
    "Mod+4".action.focus-workspace = "4";
    "Mod+5".action.focus-workspace = "5";
    "Mod+6".action.focus-workspace = "6";
    "Mod+7".action.focus-workspace = "7";
    "Mod+8".action.focus-workspace = "8";
    "Mod+9".action.focus-workspace = "9";
    "Mod+0".action.focus-workspace = "0";

    "Mod+Shift+1".action.move-column-to-workspace = "1";
    "Mod+Shift+2".action.move-column-to-workspace = "2";
    "Mod+Shift+3".action.move-column-to-workspace = "3";
    "Mod+Shift+4".action.move-column-to-workspace = "4";
    "Mod+Shift+5".action.move-column-to-workspace = "5";
    "Mod+Shift+6".action.move-column-to-workspace = "6";
    "Mod+Shift+7".action.move-column-to-workspace = "7";
    "Mod+Shift+8".action.move-column-to-workspace = "8";
    "Mod+Shift+9".action.move-column-to-workspace = "9";
    "Mod+Shift+0".action.move-column-to-workspace = "0";

    "Mod+Minus".action.set-column-width = "-10%";
    "Mod+Equal".action.set-column-width = "+10%";
    "Mod+Comma".action.consume-window-into-column = {};
    "Mod+Period".action.expel-window-from-column = {};

    "Mod+BracketLeft".action.consume-or-expel-window-left = [];
    "Mod+BracketRight".action.consume-or-expel-window-right = [];

    "Mod+R".action.switch-preset-column-width = [];
    "Mod+Alt+K".action.switch-preset-window-height = [];
    "Mod+Alt+J".action.reset-window-height = [];
    "Mod+backslash".action.maximize-column = [];
    "Mod+F".action.fullscreen-window = [];
    "Mod+S".action.toggle-window-floating = [];
    "Mod+Shift+T".action.toggle-column-tabbed-display = [];
  };
}
