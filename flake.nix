{
  description = "Zack's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    #catppuccin.url = "github:catppuccin/nix";
    #stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {


    ## My nix configs ##
    nixosConfigurations = {


        ## thinker, the old thinkpad ##
        thinker = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        #specialArgs = {inherit inputs;};
        modules = [
          ./hosts/thinker/default.nix
          #stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zack = {
              imports = [
                ./home/home.nix
                #inputs.catppuccin.homeManagerModules.catppuccin
              ];
            };

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }

          {
          _module.args = {inherit inputs; };
          }
        ];
      };


        ## virtman vm on main desktop ##
        virtman = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/virtman/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zack = {
              imports = [
                ./home/home.nix
                #inputs.catppuccin.homeManagerModules.catppuccin
              ];
            };

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }

          {
          _module.args = {inherit inputs; };
          }
        ];
      };



    };
  };
}
