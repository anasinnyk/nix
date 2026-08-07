{
  config,
  pkgs,
  ...
}:
let
  mkVicinaeExtension =
    {
      name,
      npmDepsHash,
      preBuild ? "",
    }:
    (config.lib.vicinae.mkExtension {
      inherit name npmDepsHash;
      src =
        pkgs.fetchFromGitHub {
          owner = "vicinaehq";
          repo = "extensions";
          rev = "22bc47b8ad1907a8aaeec502696a8202fac64a00";
          hash = "sha256-uspI0fHn4BsbJcZ2Fv0wmoq+MErfT5xIFSrn+iuBKe0=";
        }
        + "/extensions/${name}";
    }).overrideAttrs
      (old: {
        preBuild = (old.preBuild or "") + preBuild;
      });
in
{
  programs.vicinae = {
    enable = true;
    enableFirefoxIntegration = true;

    systemd = {
      enable = true;
      autoStart = true;
    };

    extensions = [
      (mkVicinaeExtension {
        name = "niri";
        npmDepsHash = "sha256-M2wA/MTHVR+Ut+5X08tndJ0MyHd7pSA/x4hNzlnHKYA=";
      })
      (mkVicinaeExtension {
        name = "bluetooth";
        npmDepsHash = "sha256-F/vURwdEPwzZwlS4j0lGV8aN7VDGmdiV+WCy2vXN2Eo=";

        preBuild = ''
          sed -i \
            '/require.*debug/c\var debug = function () {};' \
            node_modules/usocket/index.js
        '';
      })
      (mkVicinaeExtension {
        name = "pulseaudio";
        npmDepsHash = "sha256-4VOxzjcHlnf3ufknFu7z8s1iYpd2HN30DMWfJcW56pg=";
      })
      (mkVicinaeExtension {
        name = "firefox";
        npmDepsHash = "sha256-i2rOeiCSoS/dCQ746TCRQnpQ8BOndVkstWTs1rRmGEg=";
      })
      (mkVicinaeExtension {
        name = "nix";
        npmDepsHash = "sha256-TEyCCDjAtRYX2uH2TpLfe4/hTzyfMiyDhzVdyQXhEus=";
      })
      (mkVicinaeExtension {
        name = "ssh";
        npmDepsHash = "sha256-Ro885XCiv74oh64ubPORSUrYGeSvwlWYncrqHtXDEUg=";
      })
      (mkVicinaeExtension {
        name = "systemd";
        npmDepsHash = "sha256-g7A5sImj9GRMpn4q8aovgTw3wyHDiDglZilE0qYXlZM=";
      })
      (mkVicinaeExtension {
        name = "github";
        npmDepsHash = "sha256-7E/dbV6LQaLChriVxP0bvopZpxof5UGrrRBU5lXI9eU=";
      })
      (mkVicinaeExtension {
        name = "pass";
        npmDepsHash = "sha256-O+Wfka7rBaLZbGReOWen05M1Qvxd5IVNNC79y71zhmg=";
      })
    ];
  };
}
