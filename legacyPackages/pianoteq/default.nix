{
  alsa-lib,
  autoPatchelfHook,
  freetype,
  p7zip,
  src,
  stdenv
}: stdenv.mkDerivation {
  pname = "pianoteq";
  version = "8.2.0";
  inherit src;
  
  nativeBuildInputs = [
    p7zip
    autoPatchelfHook
  ];

  buildInputs = [
    stdenv.cc.cc.lib
    freetype
    alsa-lib
  ];

  installPhase = ''
    mkdir -p $out/{bin,lib/lv2}
    mv "x86-64bit/Pianoteq 8 STAGE" $out/bin
    mv "x86-64bit/Pianoteq 8 STAGE.lv2" $out/lib/lv2
  '';
}
