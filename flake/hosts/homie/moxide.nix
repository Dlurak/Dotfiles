let
  nvimName = " Neovim";
in
{
  enable = true;
  paths = {
    Home = "~/";
    Downloads = "~/Downloads";
    Documents = "~/Documents";
    Q-Phase = "~/Schule/Q/";
    GitHub = "~/GitHub/";
    Wiki = "~/wiki";
    Nixpkgs = "~/GitHub/nixpkgs/";
  };
  templates = {
    nvim.windows = [
      {
        name = nvimName;
        panes = [ "nvim" ];
      }
    ];
    rust.windows = [
      {
        name = nvimName;
        layout = "1996,190x42,0,0{125x42,0,0,0,64x42,126,0,3}";
        panes = [
          "nvim"
          "bacon"
        ];
      }
      {
        name = "Cargo";
        layout = "even-horizontal";
        panes = [ "cargo build" ];
      }
    ];
    svelte.windows = [
      {
        name = nvimName;
        panes = [ "nvim" ];
      }
      {
        name = "Server";
        layout = "even-horizontal";
        panes = [
          "pnpm run dev"
          "pnpm run test"
        ];
      }
    ];
  };
  projects =
    let
      mkMkPrj = template: dir: {
        inherit template;
        root_dir = dir;
      };
      mkRustPrj = mkMkPrj "rust";
      mkNvimPrj = mkMkPrj "nvim";
    in
    {
      Dlool = mkMkPrj "svelte" "~/SoftwareDevelopment/web/dlool_frontend_v2/";
      Moxide = mkRustPrj "~/SoftwareDevelopment/cli/moxide/";
      Bright = mkRustPrj "~/SoftwareDevelopment/random/bright/";
      Jiman = mkRustPrj "~/SoftwareDevelopment/random/jiman/";
      Manada = mkRustPrj "~/SoftwareDevelopment/cli/manada/";
      Muxbar = mkRustPrj "~/SoftwareDevelopment/ricing/muxbar/";
      Dotfiles = mkNvimPrj "~/Dotfiles/";
      Wiki = mkNvimPrj "~/wiki/";
      "Advent-of-code" = mkNvimPrj "~/SoftwareDevelopment/AdventOfCode/";
      OsmApp = {
        root_dir = "~/SoftwareDevelopment/web/osmapp/";
        windows = [
          {
            name = nvimName;
            panes = [ "nvim" ];
          }
          {
            name = "Server";
            panes = [ "yarn dev" ];
          }
        ];
      };
      talks = {
        root_dir = "~/talks/";
        windows = [
          {
            name = nvimName;
            panes = [ "nvim" ];
          }
          {
            name = "Rebuild";
            panes = [ "nix run nixpkgs#watchexec -- -r -e md -- nix build ." ];
          }
        ];
      };
      voxelbox = {
        root_dir = "~/SoftwareDevelopment/games/3d-pong/";
        windows = [
          {
            name = nvimName;
            panes = [ "nvim" ];
          }
          {
            name = "Cargo";
            layout = "even-horizontal";
            panes = [
              "cargo build"
              "bacon"
            ];
          }
          {
            name = "Simulator";
            panes = [ "cd ~/GitHub/voxelbox/simulator/ && python3 simulator.py" ];
          }
        ];
      };
      School = {
        root_dir = "~/Schule/Q/Notizen/";
        windows = [
          {
            name = nvimName;
            panes = [ ''nvim +$ "+set wrap" "+set bg=light"'' ];
          }
          {
            name = "Typst";
            panes = [ ''subj'' ];
          }
        ];
      };
    };
}
