{
  pkgs,
  inputs,
  ...
}:
let
  moxide = inputs.moxide.defaultPackage.${pkgs.system};
in
(pkgs.writeShellApplication {
  name = "mox";
  runtimeInputs = [
    moxide
    pkgs.fzf
  ];
  text = builtins.readFile ../customScripts/mox.sh;
})
