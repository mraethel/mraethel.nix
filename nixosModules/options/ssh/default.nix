{
  config,
  lib,
  ...
}:
let
  cfg = config.programs.ssh;

  mkValueStringSSH =
    {
      trueValue ? "yes",
      falseValue ? "no",
      nullValue ? "null",
    }:
    v:
    let
      err =
        t: v:
        abort ("generators.mkValueStringSSH: " + "${t} not supported: ${lib.generators.toPretty { } v}");
    in
    if builtins.isInt v then
      toString v
    else if lib.isDerivation v then
      toString v
    else if builtins.isString v then
      v
    else if true == v then
      trueValue
    else if false == v then
      falseValue
    else if builtins.isNull v then
      nullValue
    else if builtins.isList v then
      err "lists" v
    else if builtins.isAttrs v then
      err "attrsets" v
    else if builtins.isFunction v then
      err "functions" v
    else if builtins.isFloat v then
      lib.floatToString v
    else
      err "this value is" (toString v);

  mkKeyValueSSH =
    {
      mkValueString ? mkValueStringSSH { },
      mkNull ? false,
    }:
    sep: k: v:
    if !mkNull && builtins.isNull v then "" else "${lib.escape [ sep ] k}${sep}${mkValueString v}";

  toSSH =
    {
      mkSectionName ? (name: "Host " + name),
      mkKeyValue ? mkKeyValueSSH { } " ",
      listsAsDuplicateKeys ? false,
    }:
    attrsOfAttrs:
    let
      mkSection =
        sectName: sectValues:
        "Host ${sectName}\n"
        + lib.generators.toKeyValue { inherit mkKeyValue listsAsDuplicateKeys; } sectValues;
    in
    lib.concatStringsSep "\n" (lib.mapAttrsToList mkSection attrsOfAttrs);
in
{
  options.programs.ssh.hosts = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        options = {
          AddressFamily = lib.mkOption {
            type = lib.types.nullOr (
              lib.types.enum [
                "any"
                "inet"
                "inet6"
              ]
            );
            default = null;
          };
          HostName = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };
          HostKeyAlias = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };
          IdentitiesOnly = lib.mkOption {
            type = lib.types.nullOr lib.types.bool;
            default = null;
          };
          User = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };
        };
      }
    );
  };

  config.programs.ssh.extraConfig = toSSH { } cfg.hosts;
}
