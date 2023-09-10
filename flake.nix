{
  description = "linguist";

  inputs = {
    platform-engineering.url = "github:slimslenderslacks/nix-modules";
    #platform-engineering.url = "/Users/slim/slimslenderslacks/nix-modules";
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.11";
  };

  outputs = { nixpkgs, ... }@inputs:
    inputs.platform-engineering.ruby-project
      {
        name = "linguist";
        version = "0.1.0";
        inherit nixpkgs;
        dir = ./.;
      };

}
