{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    yubikey-manager
    libfido2
  ];
  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;

      settings = {
        "*" = {
          AddKeysToAgent = "no";
          ForwardAgent = false;
        };

        "github.com" = {
          HostName = "github.com";
          User = "git";

          IdentitiesOnly = true;
          IdentityFile = "~/.ssh/id_ed25519_sk_github";
        };
      };
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "Andrii Nasinnyk";
          email = "anasinnyk@pm.me";
          signingkey = "${config.home.homeDirectory}/.ssh/sign_ed25519_sk_github.pub";
        };
        init = {
          defaultBranch = "main";
        };
        gpg = {
          format = "ssh";
        };
        diff = {
          colormoved = "zebra";
        };
        alias = {
          huyak = "!git add . && git commit --amend --no-edit && git push -f";
        };
      };
    };
    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };
    gh-dash = {
      enable = true;
    };
  };
}
