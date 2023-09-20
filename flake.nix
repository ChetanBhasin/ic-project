{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devshell.url = "github:numtide/devshell";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, flake-utils, devshell, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShells.default = let
        pkgs = import nixpkgs {
          inherit system;

          overlays = [ devshell.overlays.default ];
        };
      in pkgs.devshell.mkShell ({ config, ... }: {
        packages =
          [ pkgs.terraform pkgs.kubectl pkgs.kubernetes-helm pkgs.awscli2 ];
        commands = [
          {
            name = "versions";
            command = ''
              echo "Welcome to the devshell!"
              echo "Checking terraform version..."
              terraform version
              echo "Checking kubectl version..."
              kubectl version --client
              echo "Checking helm version..."
              helm version --short
            '';
          }
          {
            name = "plan";
            command = "terraform plan";
          }
          {
            name = "init";
            command = "terraform init -reconfigure";
          }
        ];
      });
    });
}
