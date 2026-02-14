{
  lib,
  ...
}:
let
  prefix = "nixos/";
  src =
    with lib.fileset;
    (toSource rec {
      root = ../../..;
      fileset = fileFilter (file: file.name != "result") root;
    });
in
{
  environment.etc = lib.attrsets.listToAttrs (
    map (p: {
      name = prefix + lib.path.removePrefix (src.origSrc + "/") p;
      value = {
        source = p;
        mode = "0644";
      };
    }) (with lib.fileset; toList (fromSource src))
  );
}
