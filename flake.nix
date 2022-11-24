{
  description = "My nix configs";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-22.05";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

    querolerbot.url = "github:gp2112/querolerbot";
    querolerbot.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, hyprland, flake-utils, querolerbot, ... }@inputs:
    let
      inherit (builtins) attrValues;
      inherit (flake-utils.lib) eachDefaultSystemMap;
      inherit (home-manager.lib) homeManagerConfiguration;
    in
    rec {
      # Conjunto de mudanças à coleção de pacotes
      overlays = {
        # Nossas modificações
        default = import ./overlay;
        # Pacotes e modificações que o hyprland exporta
        hyprland = hyprland.overlays.default;
        querolerbot = querolerbot.overlays.default;
      };


      # Exportar pacotes com todas as overlays aplicadas
      packages = eachDefaultSystemMap (system:
        import nixpkgs {
          inherit system;
          overlays = attrValues overlays;
          config.allowUnfree = true;
        }
        );

      packages-stable = eachDefaultSystemMap (system:
        import nixpkgs-stable {
          inherit system;
          overlays = attrValues overlays;
          config.allowUnfree = true;
        }
      );

      # Configurações NixOS
      nixosConfigurations = {
        slowdive = nixpkgs.lib.nixosSystem {
          # Configuração
          modules = [
            ./hosts/slowdive
          ];
          # Repassar nossos inputs, para permitir referenciar da config
          specialArgs = { inherit inputs; };
          # Nossos pacotes
          pkgs = packages.x86_64-linux;
          system = "x86_64-linux";
        };
        rasp = nixpkgs-stable.lib.nixosSystem {
          modules = [
            ./hosts/rasp
            querolerbot.nixosModules.default
          ];
          specialArgs = { inherit inputs; };

          pkgs = packages-stable.aarch64-linux;
          system = "aarch64-linux";
        };
        frostbyte = nixpkgs.lib.nixosSystem {
          modules = [
            ./hosts/frostbyte
          ];
          specialArgs = { inherit inputs; };

          pkgs = packages.x86_64-linux;
          system = "x86_64-linux";

        };
        rasp = nixpkgs-stable.lib.nixosSystem {
          modules = [
            ./hosts/sputnik
            querolerbot.nixosModules.default
          ];
          specialArgs = { inherit inputs; };

          pkgs = packages-stable.x86_64-linux;
          system = "x86_64-linux";
        };
      };

      homeConfigurations = {
        "gui@slowdive" = homeManagerConfiguration {
          # Configuração
          modules = [ ./home/gui/slowdive ./modules/home-manager ];
          # Repassar nossos inputs, para permitir referenciar da config
          extraSpecialArgs = { inherit inputs; };
          # Nossos pacotes
          pkgs = packages.x86_64-linux;
        };

        "gui@rasp" = homeManagerConfiguration {
          modules = [ ./home/gui/rasp ];
          extraSpecialArgs = { inherit inputs; };
          pkgs = packages.aarch64-linux;
        };
        "gui@frostbyte" = homeManagerConfiguration {
          modules = [ ./home/gui/frostbyte ./modules/home-manager ];
          extraSpecialArgs = { inherit inputs; };
          pkgs = packages.x86_64-linux;
        };

      };
    };
}
