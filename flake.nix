{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs.dotfiles = {
    url = "github:tatenami/dotfiles";
    flake = false;
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, dotfiles, ... }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in 
  {
    # VM環境
    nixosConfigurations = {
      vm = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./hosts/vm
          # home-manager
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            
            # user 
            home-manager.users.tatenami = {
              imports = [
                ./modules/home
              ];
            };
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
          }

          ({ modulesPath, ... }: {
            imports = [ "${modulesPath}/virtualisation/qemu-vm.nix" ];

            # VM 操作用
            virtualisation = {
              memorySize = 2048;
              forwardPorts = [
                { from = "host"; host.port = 2222; guest.port = 22; }
              ];

              qemu.options = [
                "-display gtk,grab-on-hover=on"
                "-device virtio-keyboard"
              ];
            };
          })
        ];
      };
    }; # for VM setting 
  };
}
