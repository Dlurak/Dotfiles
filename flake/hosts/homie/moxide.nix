let
  dirs = attr:
    map (name: {
      inherit name;
      path = attr.${name};
    }) (builtins.attrNames attr);
  nvimName = " Neovim";
in {
  enable = true;
  paths = dirs {
    Home = "~/";
    Downloads = "~/Downloads";
    Documents = "~/Documents";
    E-Phase = "~/Schule/E-1/";
    Informatik = "~/Schule/E-1/Informatik/";
    GitHub = "~/GitHub/";
    Wiki = "~/wiki";
    Nixpkgs = "~/GitHub/nixpkgs/";
  };
  templates = {
    nvim.windows = [
      {
        name = nvimName;
        panes = ["nvim"];
      }
    ];
    rust.windows = [
      {
        name = nvimName;
        layout = "1996,190x42,0,0{125x42,0,0,0,64x42,126,0,3}";
        panes = ["nvim" "bacon"];
      }
      {
        name = "Cargo";
        layout = "even-horizontal";
        panes = ["cargo build"];
      }
    ];
    svelte.windows = [
      {
        name = nvimName;
        panes = ["nvim"];
      }
      {
        name = "Server";
        layout = "even-horizontal";
        panes = ["pnpm run dev" "pnpm run test"];
      }
    ];
    typst-school = {
      hidden = true;
      windows = [
        {
          name = nvimName;
          panes = [''nvim +$ "+colorscheme tokyonight-day" "+set wrap" main.typ''];
        }
        {
          name = "Typst";
          layout = "even-horizontal";
          panes = ["zathura main.pdf" "typst watch main.typ"];
        }
      ];
    };
  };
  projects = let
    mkMkPrj = template: dir: {
      inherit template;
      root_dir = dir;
    };
    mkRustPrj = mkMkPrj "rust";
    mkNvimPrj = mkMkPrj "nvim";
  in {
    Dlool = mkMkPrj "svelte" "~/SoftwareDevelopment/web/dlool_frontend_v2/";
    Moxide = mkRustPrj "~/SoftwareDevelopment/cli/moxide/";
    Jiman = mkRustPrj "~/SoftwareDevelopment/random/jiman/";
    Manada = mkRustPrj "~/SoftwareDevelopment/cli/manada/";
    Muxbar = mkRustPrj "~/SoftwareDevelopment/ricing/muxbar/";
    Dotfiles = mkNvimPrj "~/Dotfiles/";
    Wiki = mkNvimPrj "~/wiki/";
    OsmApp = {
      root_dir = "~/SoftwareDevelopment/web/osmapp/";
      windows = [
        {
          name = nvimName;
          panes = ["nvim"];
        }
        {
          name = "Server";
          panes = ["yarn dev"];
        }
      ];
    };
    "Advent-of-code" = mkNvimPrj "~/SoftwareDevelopment/AdventOfCode/";
    talks = {
      root_dir = "~/talks/";
      windows = [
        {
          name = nvimName;
          panes = ["nvim"];
        }
        {
          name = "Rebuild";
          panes = ["nix run nixpkgs#watchexec -- -r -e md -- nix build ."];
        }
      ];
    };
    voxelbox = {
      root_dir = "~/SoftwareDevelopment/games/3d-pong/";
      windows = [
        {
          name = nvimName;
          panes = ["nvim"];
        }
        {
          name = "Cargo";
          layout = "even-horizontal";
          panes = ["cargo build" "bacon"];
        }
        {
          name = "Simulator";
          panes = ["cd ~/GitHub/voxelbox/simulator/ && python3 simulator.py"];
        }
      ];
    };
  };
}
