{
  description = "b0xfox's NVF Powered Neovim Config";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    simple-dark = {
      url = "github:tek256/simple-dark";
      flake = false;
    };

  };

outputs =
    {
      nixpkgs,
      nvf,
      simple-dark,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      mkNeovim =
        pkgsSet:
        (nvf.lib.neovimConfiguration {
          pkgs = pkgsSet;
          extraSpecialArgs = { inherit simple-dark; };
          modules = [ (import ./nvf) ];
        }).neovim;
    in
    {
      packages.${system}.default = mkNeovim pkgs;

      overlays.default = final: prev: {
        my-neovim = mkNeovim final;
      };
    };

}
