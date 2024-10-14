{
  config,
  pkgs,
  lib,
  ...
}: let
  utils = import ../../utils.nix {lib = lib;};
  generators = import ./mkYaml.nix {
    lib = lib;
    pkgs = pkgs;
  };
in {
  options = {
    homeManagerModules.moxide.enable = lib.mkEnableOption "Enable moxide (config)";

    homeManagerModules.moxide.paths = lib.mkOption {
      type = with lib.types; listOf (attrsOf str);
      default = [
        {
          name = "Home";
          path = "~/";
        }
      ];
      description = "List of directories with name and path to include in the YAML file";
    };
    homeManagerModules.moxide.templates = lib.mkOption {
      default = {
        "nvim".windows = [
          {
            name = " Neovim";
            panes = ["nvim"];
          }
        ];
      };
      description = "List of directories with name and path to include in the YAML file";
    };
    homeManagerModules.moxide.projects = lib.mkOption {
      default = {};
      description = "List of projects with name and path to include in the yaml files";
    };
  };

  config = lib.mkIf config.homeManagerModules.moxide.enable {
    home.file = let
      directories = {
        ".config/moxide/directories.yaml".text = generators.mkDirectoryYaml config.homeManagerModules.moxide.paths;
      };
      templates =
        utils.transformAttrs
        (config.homeManagerModules.moxide.templates)
        (entry: ".config/moxide/templates/${entry.key}.yaml")
        (entry: {text = generators.mkTemplateYaml entry;});
      projects =
        utils.transformAttrs
        (config.homeManagerModules.moxide.projects)
        (entry: ".config/moxide/projects/${entry.key}.yaml")
        (entry: {text = generators.mkProjectYaml entry;});
    in
      directories
      // templates
      // projects;
  };
}
