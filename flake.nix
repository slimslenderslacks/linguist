{
  description = "linguist";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:

    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
	gems = pkgs.bundlerEnv {
	  name = "gems-for-github-linguist";
	  gemdir = ./.;
	};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [ bundix
				  openssl
				  gems
				  gems.wrappedRuby
				  ];
        };
	packages.default = pkgs.bundlerApp {
	  pname = "github-linguist";
	  gemdir = ./.;
	  exes = [ "github-linguist" ];
	};
      });
}
