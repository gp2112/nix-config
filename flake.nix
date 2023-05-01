{
  description = "My nix configs";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-22.11";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, nixpkgs-stable, nixpkgs-master, home-manager, flake-utils, ... }@inputs:
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

      packages-master = eachDefaultSystemMap (system:
        import nixpkgs-master {
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
      };

      homeConfigurations = {
        "gui@slowdive" = homeManagerConfiguration {
          # Configuração
          modules = [ ./home/gui/slowdive ./modules/home-manager ];
          # Repassar nossos inputs, para permitir referenciar da config
          extraSpecialArgs = { inherit inputs; pkgs-master = packages-master.x86_64-linux; };
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
          extraSpecialArgs = { inherit inputs; pkgs-master = packages-master.x86_64-linux; };
          pkgs = packages.x86_64-linux;
        };
      };
    };
}
