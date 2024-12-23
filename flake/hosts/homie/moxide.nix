{
    enable = true;
    paths = [
      {
        name = "Home";
        path = "~/";
      }
      {
        name = "Downloads";
        path = "~/Downloads";
      }
      {
        name = "Documents";
        path = "~/Documents";
      }
      {
        name = "E-Phase";
        path = "~/Schule/E-1/";
      }
      {
        name = "Informatik";
        path = "~/Schule/E-1/Informatik/";
      }
      {
        name = "GitHub";
        path = "~/GitHub/";
      }
    ];
    templates = {
	  baseDev.windows = [
        {
          name = " Neovim";
          panes = ["nix develop --command nvim"];
        }
        {
          name = " Nix-Shell";
          panes = ["nix develop"];
        }
	  ];
      nvim.windows = [
        {
          name = " Neovim";
          panes = ["nvim"];
        }
      ];
      nix.windows = [
        {
          name = " Nix-Shell";
          panes = ["nix develop"];
        }
      ];
      rust.windows = [
        {
          name = " Neovim";
          panes = ["nvim"];
        }
        {
          name = "Cargo";
          layout = "even-horizontal";
          panes = ["cargo run" "bacon"];
        }
      ];
      svelte.windows = [
        {
          name = " Neovim";
          panes = ["nix develop --command nvim"];
        }
        {
          name = "Server";
          layout = "even-horizontal";
          panes = ["nix develop --command pnpm run dev" "nix develop --command pnpm run test"];
        }
      ];
    };
    projects = {
      Moxide = {
        root_dir = "~/SoftwareDevelopment/cli/moxide/";
        template = "rust";
      };
      Dotfiles = {
        root_dir = "~/Dotfiles/";
        template = "nvim";
      };
      OSMApp = {
        root_dir = "~/SoftwareDevelopment/web/osmapp/";
        windows = [
          {
            name = " Neovim";
            panes = ["nix develop --command nvim"];
          }
          {
            name = "Server";
            panes = ["nix develop --command yarn dev"];
          }
          {
            name = " Nix-Shell";
            panes = ["nix develop"];
          }
        ];
      };
      aoc = {
        root_dir = "~/SoftwareDevelopment/AdventOfCode/";
        template = "baseDev";
      };
      workshop = {
        root_dir = "~/talks/";
        template = "baseDev";
      };
    };
  }
