{ inputs, config, lib, ... }:
let cfg = config.programs.firefox.tokyonight;
in {
  options.programs.firefox.tokyonight =
    (lib.tn.mkTokyonightOpt "tokyonight firefox") // {
      profileName = lib.mkOption {
        type = lib.types.str;
        description = "The name of your Firefox profile to apply the theme to";
        example = "default";
      };
      extraUserChromeCSS = lib.mkOption {
        type = lib.types.lines;
        default = "";
        example = ''
          * {
            font-family: 'Some other font';
          }
        '';
      };
      extraUserContentCSS = lib.mkOption {
        type = lib.types.lines;
        description = "Extra CSS to add to userContent.css";
        default = "";
        example = ''
          @-moz-document url("about:home"),
          url("about:blank"),
          url("about:newtab") {
            // remove background
            body::before {
              background: none!important;
            }
          }
        '';
      };
    };
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      home.file.".mozilla/firefox/default/chrome/firefox-tokyonight-theme" = {
        # don't include
        source = "${inputs.tokyonight-firefox}/firefox-css/chrome";
        recursive = true;
      };
      programs.firefox.profiles.${cfg.profileName} = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" =
            true; # Enable customChrome.cs
          "svg.context-properties.content.enabled" =
            true; # Enable SVG context-propertes
        };
        userChrome = ''
          @import "firefox-tokyonight-theme/userChrome.css";

          ${cfg.extraUserChromeCSS}
        '';
        userContent = ''
          @import "firefox-tokyonight-theme/userContent.css";

          ${cfg.extraUserContentCSS}
        '';
      };
    })
  ];
}
