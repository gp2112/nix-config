{
  description = "My nix configs";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, hyprland, flake-utils, ... }@inputs:
    let
      inherit (builtins) attrValues;
      inherit (flake-utils.lib) eachDefaultSystemMap;
      inherit (nixpkgs.lib) nixosSystem;
      inherit (home-manager.lib) homeManagerConfiguration;
    in
    rec {
      # Conjunto de mudanças à coleção de pacotes
      overlays = {
        # Nossas modificações
        default = import ./overlay;
        # Pacotes e modificações que o hyprland exporta
        hyprland = hyprland.overlays.default;
      };


      # Exportar pacotes com todas as overlays aplicadas
      packages = eachDefaultSystemMap (system:
        import nixpkgs {
          inherit system;
          overlays = attrValues overlays;
          config.allowUnfree = true;
        }
      );

      # Configurações NixOS
      nixosConfigurations = {
        slowdive = nixosSystem {
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
        rasp = nixosSystem {
          modules = [ 
            ./hosts/rasp
          ];
          specialArgs = { inherit inputs; };

          pkgs = packages.aarch64-linux;
          system = "aarch64-linux";
        };
        frostbyte = nixosSystem {
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
          modules = [ ./home/gui/frostbyte ];
          extraSpecialArgs = { inherit inputs; };
          pkgs = packages.x86_64-linux;
          
        };

      };
    };
}
