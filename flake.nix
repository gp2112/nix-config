{
  description = "My nix configs";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Utilities for building our flake
    flake-utils.url = "github:numtide/flake-utils";

    # Extra flakes for modules, packages, etc
    hardware.url = "github:nixos/nixos-hardware"; # Convenience modules for hardware-specific quirks
   
   # nur.url = "github:nix-community/NUR";              # User contributed pkgs and modules
    # nix-colors.url = "github:misterio77/nix-colors";   # Color schemes for usage with home-manager
    # impermanence.url = "github:riscadoa/impermanence"; # Utilities for opt-in persistance
    
    # Add any other flakes you need
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";


  };

  outputs = { nixpkgs, home-manager, flake-utils, ... }@inputs:
    let
      # Bring some functions into scope (from builtins and other flakes)
      inherit (builtins) attrValues;
      inherit (flake-utils.lib) eachSystemMap defaultSystems;
      inherit (nixpkgs.lib) nixosSystem;
      inherit (home-manager.lib) homeManagerConfiguration;
      eachDefaultSystemMap = eachSystemMap defaultSystems;
    in
    rec {
      # TODO: If you want to use packages exported from other flakes, add their overlays here.
      # They will be added to your 'pkgs'

      overlays = {
        default = import ./overlay;
      };

      # System configurations
      # Accessible via 'nixos-rebuild'
      nixosConfigurations = {

        slowdive = nixosSystem {
          system = "x86_64-linux";

          modules = [
            inputs.hyprland.nixosModules.default
            # >> Main NixOS configuration file <<
            ./hosts/slowdive
            # Adds your custom NixOS modules
            ./modules/nixos
            # Adds overlays
            { nixpkgs.overlays = attrValues overlays; }
          ];
          # Make our inputs available to the config (for importing modules)
          specialArgs = { inherit inputs; };
        };
      };

      # Home configurations
      # Accessible via 'home-manager'
      homeConfigurations = {
        # FIXME: Replace with your username@hostname
        "gui@slowdive" = homeManagerConfiguration rec {
          # FIXME: Replace with your username
          username = "gui";
          homeDirectory = "/home/${username}";
          system = "x86_64-linux";

          # >> Main home-manager configuration file <<
          configuration = ./home/gui;
          extraModules = [
            # Adds your custom home-manager modules
            ./modules/home-manager
            # Adds overlays
            { nixpkgs.overlays = attrValues overlays; }
          ];
          # Make our inputs available to the config (for importing modules)
          extraSpecialArgs = { inherit inputs; };
        };
      };

      # Packages
      # Accessible via 'nix build'
      packages = eachDefaultSystemMap (system:
        # Propagate nixpkgs' packages, with our overlays applied
        import nixpkgs { inherit system; overlays = attrValues overlays; }
      );

      # Devshell for bootstrapping
      # Accessible via 'nix develop'
      devShells = eachDefaultSystemMap (system: {
        default = import ./shell.nix { pkgs = packages.${system}; };
      });
    };
}
