# { pkgs, ... }:

# let
#   doom-emacs = pkgs.callPackage (builtins.fetchTarball {
#     url = https://github.com/vlaci/nix-doom-emacs/archive/develop.tar.gz;
#   }) {
#     doomPrivateDir = ./doom.d;  # Directory containing your config.el init.el
#                                 # and packages.el files
#   };
# in {
#   home.packages = [
#     doom-emacs
#   ];
#   home.file.".emacs.d/init.el".text = ''
#       (load "default.el")
#   '';

#   services.emacs = {
#     enable = true;
#     package = doom-emacs;
#   };
# }

{ pkgs, ... }:
with pkgs; {
  home.file.".doom.d" = {
    source = ./doom;
    recursive = true;
    onChange = ''
      DOOM="$HOME/.emacs.d"

      if [ ! -d "$DOOM" ]; then
        git clone https://github.com/hlissner/doom-emacs.git $DOOM
        $DOOM/bin/doom -y install
      fi

      $DOOM/bin/doom sync
    '';
  };

  home.packages = [
    # required dependencies
    git
    emacs
    ripgrep
    nixfmt
  ];

  home.sessionPath = [ "~/.emacs.d/bin" ];

  services.emacs.enable = true;
}

