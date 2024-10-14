{
  lib,
  pkgs,
}: let
  utils = import ../../utils.nix {lib = lib;};
  mkLayout = window:
    if builtins.hasAttr "layout" window
    then "layout: ${window.layout}"
    else "";
  mkWindowYaml = window: ''
     - name: ${window.name}
       panes:
    ${utils.indent (lib.concatLines (builtins.map (p: "- ${p}") window.panes))}
       ${mkLayout window}
  '';
  mkWindowsYaml = windows: lib.concatLines (builtins.map mkWindowYaml windows);
in {
  mkDirectoryYaml = paths:
    lib.concatStringsSep "\n" (
      builtins.map (
        pathSet: ''
          - name: "${pathSet.name}"
            path: "${pathSet.path}"
        ''
      )
      paths
    );

  mkTemplateYaml = template: ''
    name: ${template.key}
    windows:
    ${utils.indent (mkWindowsYaml template.value.windows)}
  '';

  mkProjectYaml = project: ''
    name: ${project.key}
    root_dir: ${project.value.root_dir}
    ${
      if builtins.hasAttr "template" project.value
      then "template: ${project.value.template}"
      else ''
        windows:
        ${utils.indent (mkWindowsYaml project.value.windows)}
      ''
    }
  '';
}
