{ pkgs, self, system, ... }:

{
  home.packages = with pkgs; [
    # System Control
    nitrogen
    brightnessctl
    pavucontrol

    # Apps
    firefox
    google-chrome
    libreoffice
    spotify
    discord
    slack
    mgba
    gimp
    qbittorrent
    calibre
    blender
    inkscape
    zoom-us
    signal-desktop
    desmume
    vlc
    mullvad-vpn
    self.packages.${system}.crossfire

    # Minecraft
    polymc

    # CLI Tools
    unar
    zathura
    ripgrep
    du-dust
    htop
    maim
    mupdf
    ffmpeg-full
    yt-dlp
    croc

    # Development
    (python3.withPackages (ps:
      with ps; [
        ipython
        black
        isort
      ]))
    jupyter
    poetry
    gnumake
    docker
    self.packages.${system}.mytex

    # pokemon
    self.packages.${system}.pkhex
    self.packages.${system}.ekhex
    self.packages.${system}.porymap
    self.packages.${system}.pokemon-colorscripts
  ];
}
