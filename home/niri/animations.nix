_: {
  programs.niri = {
    settings = {
      animations = {
        enable = true;
        window-open = {
          easing = {
            duration-ms = 200;
            curve = "linear";
          };
        };

        window-close = {
          easing = {
            duration-ms = 200;
            curve = "linear";
          };
        };
        shaders = {
          window-open = ''
            vec4 expanding_circle(vec3 coords_geo, vec3 size_geo) {
              vec3 coords_tex = niri_geo_to_tex * coords_geo;
              vec4 color = texture2D(niri_tex, coords_tex.st);
              vec2 coords = (coords_geo.xy - vec2(0.5, 0.5)) * size_geo.xy * 2.0;
              coords = coords / length(size_geo.xy);
              float p = niri_clamped_progress;
              if (p * p <= dot(coords, coords))
              color = vec4(0.0);

              return color;
            }
            vec4 open_color(vec3 coords_geo, vec3 size_geo) {
              return expanding_circle(coords_geo, size_geo);
            }
          '';

          window-close = ''
            vec4 shrinking_circle(vec3 coords_geo, vec3 size_geo) {
              vec3 coords_tex = niri_geo_to_tex * coords_geo;
              vec4 color = texture2D(niri_tex, coords_tex.st);
              vec2 coords = (coords_geo.xy - vec2(0.5, 0.5)) * size_geo.xy * 2.0;
              coords = coords / length(size_geo.xy);
              float p_close = 1.0 - niri_clamped_progress;
              if (p_close * p_close <= dot(coords, coords))
              color = vec4(0.0);
              return color;
            }
            vec4 close_color(vec3 coords_geo, vec3 size_geo) {
              return shrinking_circle(coords_geo, size_geo);
            }'';
        };
      };
    };
  };
}
