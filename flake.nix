{
  description = "linguist";

  inputs = {
    platform-engineering.url = "github:slimslenderslacks/nix-modules";
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.11";
  };

  outputs = { nixpkgs, ... }@inputs:
    inputs.platform-engineering.ruby-project
      {
        inherit nixpkgs;
        dir = ./.;
      };

}
