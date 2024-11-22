{
  description = "Rew's Neovim Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      overlay =
        final: prev:
        let
          pkgs = final;
          runtimeDeps = with pkgs; [
            nixd
            nixfmt-rfc-style
            deadnix
            lua
            lua-language-server
            stylua
            gcc
            rustc
            cargo
          ];

          nvim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
            pkgs.neovimUtils.makeNeovimConfig {
              customRC = ''
                set runtimepath^=${./.}
                source ${./.}/init.lua
              '';
            }
            // {
              wrapperArgs = [
                "--prefix"
                "PATH"
                ":"
                "${lib.makeBinPath runtimeDeps}"
              ];
            }
          );
        in
        {
          neovim = nvim;
        };
    in
    {
      overlay = overlay;

      packages = {
        default = overlay nixpkgs.pkgs nixpkgs.pkgs;
      };
    };
}
