{
  description = "linguist";

  inputs = {
    platform-engineering = {
      url = "github:slimslenderslacks/nix-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
