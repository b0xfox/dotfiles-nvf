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
      pkgs = import nixpkgs { system = system; };
      configModule = import ./nvf;
      customNeovim = nvf.lib.neovimConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit simple-dark; };
        modules = [ configModule ];
      };
    in
    {
      packages.${system}.my-neovim = customNeovim.neovim;
      homeManagerModules.default =
        { ... }:
        {
          imports = [ ./nvf ];
          _module.args.simple-dark = simple-dark;
        };
    };

}
