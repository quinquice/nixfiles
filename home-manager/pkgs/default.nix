{ pkgs, ... }:
{
    home.packages = with pkgs; [
        (pkgs.callPackage ./pkhex { })
        (pkgs.callPackage ./poryscript { })
        (pkgs.callPackage ./porymap { })
        (pkgs.callPackage ./tex { })
    ];
}