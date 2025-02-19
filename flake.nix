{
  description = "Project Description"; # TODO: Description

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    devenv.url = "github:cachix/devenv";
    nix2container.url = "github:nlewo/nix2container";
    nix2container.inputs.nixpkgs.follows = "nixpkgs";
    mk-shell-bin.url = "github:rrbutani/nix-mk-shell-bin";
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs =
    inputs@{ flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.devenv.flakeModule ];
      systems = [
        "x86_64-linux"
        "i686-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      perSystem =
        {
          config,
          self',
          inputs',
          pkgs,
          system,
          ...
        }:
        let
          python-packages =
            p: with p; [
              pip
              python-lsp-server
              importmagic
              epc
              black
              mypy
            ];
        in
        {
        _module.args.pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          config.permittedInsecurePackages = [ "mongodb" ];
        };

          devenv.shells.default = {
            name = "Project Name"; # TODO: Name
            difftastic.enable = true;

            imports = [ ];

            # https://devenv.sh/reference/options/
            packages = with pkgs; [
              stdenv.cc.cc.lib # required by Jupyter
              (python3.withPackages python-packages)
            ];

            env = { };

            # https://devenv.sh/scripts/
            # scripts.hello.exec = "";

            # enterShell = ''
            # '';

            # https://devenv.sh/languages/
            languages.python = {
              enable = true;
              poetry = {
                enable = true;
                activate.enable = true;
                install.enable = true;
                install.allExtras = true;
              };
            };

            # https://devenv.sh/pre-commit-hooks/
            pre-commit.hooks = {
              black.enable = true;
              nixfmt.enable = true;
              nixfmt.package = pkgs.nixfmt-rfc-style;
              pyright.enable = false;
            };

            services.mongodb = {
              enable = true;
              package = pkgs.mongodb;
              initDatabaseUsername = "testing";
              initDatabasePassword = "test123";
              additionalArgs = [
                "--port"
                "27017"
                "--noauth"
              ];
            };

            # https://devenv.sh/integrations/dotenv/
            dotenv.enable = true;
          };
        };
      flake = { 
      };
    };
}
