{ config, pkgs, custom, machine, inputs, ... }:

{
  users.users.cgunn = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "scanner" "lp" ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.cgunn = {

    _module.args = {
      style = import ../../hcom/style;
      inherit custom machine inputs;
    };
    imports = [
      ../../hcom/pkgs
      ../../hcom/neofetch
      ../../hcom/kitty
      ../../hcom/shell
      ../../hcom/xserver
      ../../hcom/userdirs
      ../../hcom/scripts
      ../../hcom/doom-emacs
      ../../hcom/neovim
      ../../hcom/chess
    ];

  };
}
