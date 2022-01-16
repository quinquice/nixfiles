{ ... }:

{
  # Module to pass extra arguments to modules
  passArgs = args: { config._module.args = args; };

  # Module to enable nix flakes
  useFlakes = { pkgs, ... }: {
    nix = {
      package = pkgs.nixFlakes;
      extraOptions = ''
        experimental-features = nix-command flakes ca-derivations
      '';
    };
  };

  # pin flakes and nixpkgs
  pinFlakes = flakes: {
    nix.registry =
      builtins.foldl' (a: x: a // { ${x}.flake = flakes.${x}; }) { }
      (builtins.attrNames flakes);
    nix.nixPath =
      builtins.map (x: "${x}=${flakes.${x}}") (builtins.attrNames flakes);
  };
}
