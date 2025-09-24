{ pkgs }:
pkgs.texlive.combine {
  inherit (pkgs.texlive)
    breqn
    catchfile
    etoolbox
    koma-script
    pgf
    scheme-basic
    setspace
    svg
    transparent
    trimspaces
    venndiagram
    xcolor
    xkeyval
    ;
}
