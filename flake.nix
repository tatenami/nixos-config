{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }: {
    # VM環境
    nixosConfigurations = {
      vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        # VM 操作用

        modules = [
          ./hosts/vm/default.nix

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
    };
  };
}
