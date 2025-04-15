{ ... }:
let
  mkMatchRule = { appId, title ? "", openFloating ? false, }:
    let
      baseRule = {
        matches = [{
          app-id = appId;
          inherit title;
        }];
      };
      floatingRule = if openFloating then { open-floating = true; } else { };
    in baseRule // floatingRule;

  openFloatingAppIds = [
    "^(file_progress)"
    "^(confirm)"
    "^(dialog)"
    "^(download)"
    "^(notification)"
    "^(error)"
    "^(splash)$"
    "^(nwg-look)$"
    "^(confirmreset)$"
  ];

  floatingRules = builtins.map (appId:
    mkMatchRule {
      appId = appId;
      openFloating = true;
    }) openFloatingAppIds;

  windowRules = [
    {
      geometry-corner-radius = let radius = 8.0;
      in {
        bottom-left = radius;
        bottom-right = radius;
        top-left = radius;
        top-right = radius;
      };
      clip-to-geometry = true;
      draw-border-with-background = false;
    }
    {
      matches = [{ is-floating = true; }];
      shadow.enable = true;
    }
    {
      matches = [{ is-window-cast-target = true; }];
      focus-ring = {
        active.color = "#f38ba8";
        inactive.color = "#7d0d2d";
      };

      border = { inactive.color = "#7d0d2d"; };

      shadow = { color = "#7d0d2d70"; };

      tab-indicator = {
        active.color = "#f38ba8";
        inactive.color = "#7d0d2d";
      };
    }
    {
      matches = [{ app-id = "org.telegram.desktop"; }];
      block-out-from = "screencast";
    }
    {
      matches = [{ app-id = "app.drey.PaperPlane"; }];
      block-out-from = "screencast";
    }
    {
      matches = [
        { app-id = "^(zen|firefox|chromium-browser|chrome-.*|zen-.*)$"; }
        { app-id = "^(xdg-desktop-portal-gtk)$"; }
      ];
      scroll-factor = 0.7;
    }
    {
      matches = [{ app-id = "^(zen|zen-.*)$"; }];
      open-on-workspace = "1";
    }
    {
      matches = [{ app-id = "^(Element)$"; }];
      open-on-workspace = "3";
    }
    {
      matches = [{ app-id = "^(org.gnome.Nautilus|thunar)$"; }];
      open-on-workspace = "6";
    }
    {
      matches = [{ app-id = "^(sioyek|zathura|obsidian)$"; }];
      open-on-workspace = "7";
    }
    {
      matches = [{ app-id = "^(spotify|youtueb-music)$"; }];
      open-on-workspace = "8";
    }
    {
      matches = [{ app-id = "^(vesktop|vesktop(.*))$"; }];
      open-on-workspace = "9";
    }
    {
      matches = [{
        app-id =
          "^(zen|firefox|chromium-browser|edge|chrome-.*|zen-.*|obsidian|org.telegram.desktop|vesktop|Element|org.gnome.Nautilus)$";
      }];
      open-maximized = true;
    }
    {
      matches = [
        {
          app-id = "firefox$";
          title = "^Picture-in-Picture$";
        }
        {
          app-id = "zen-.*$";
          title = "^Picture-in-Picture$";
        }
        { title = "^Picture in picture$"; }
        { title = "^Discord Popout$"; }
      ];
      open-floating = true;
      default-floating-position = {
        x = 32;
        y = 32;
        relative-to = "top-right";
      };
    }

    {
      matches = [

        { title = "^(Delete Profile)$"; }
        { title = "^(File Operation Progress)$"; }
        { title = "^Confirm to replace files$"; }
        { title = "^KDE Connect URL handler$"; }
        { title = "^(Open File)(.*)$"; }
        { title = "^(Select a File)(.*)$"; }
        { title = "^(Choose wallpaper)(.*)$"; }
        { title = "^(Open Folder)(.*)$"; }
        { title = "^(Save As)(.*)$"; }
        { title = "^(Library)(.*)$"; }
        { title = "^(File Upload)(.*)$"; }
        { title = "^(hyprland-share-picker)$"; }
        { title = "^(.*)-Google$"; }
        { title = "^(.*)System Update$"; }
        { title = "^(pwvucontrol)"; }
        { title = "^(Volume Control)"; }
      ];
      open-floating = true;
    }
  ];
in { programs.niri.settings.window-rules = windowRules ++ floatingRules; }
