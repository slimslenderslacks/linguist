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
	#ruby = pkgs.ruby.withPackages (ps: with ps; [ pry ] );
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [ neovim 
				  #ruby 
				  ];

	  shellHook = ''
	    export DEV_ENV=nixie
	  '';
        };
      });
}
