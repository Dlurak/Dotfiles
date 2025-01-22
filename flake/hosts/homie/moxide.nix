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
          panes = ["nvim"];
        }
        {
          name = " Nix-Shell";
          panes = ["git status"];
        }
	  ];
      nvim.windows = [
        {
          name = " Neovim";
          panes = ["nvim"];
        }
      ];
      nixShell.windows = [
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
          panes = ["nvim"];
        }
        {
          name = "Server";
          layout = "even-horizontal";
          panes = ["pnpm run dev" "pnpm run test"];
        }
      ];
    };
    projects = {
	  Dlool ={
        root_dir = "~/SoftwareDevelopment/web/dlool_frontend_v2/";
        template = "svelte";
	  };
      Moxide = {
        root_dir = "~/SoftwareDevelopment/cli/moxide/";
        template = "rust";
      };
      Dotfiles = {
        root_dir = "~/Dotfiles/";
        template = "nvim";
      };
	  School = {
        root_dir = "~/Schule/E-1/Notizen";
        windows = [
          {
            name = " Neovim";
            panes = ["nvim Mathematik/main.tex"];
          }
          {
            name = "LaTeX";
		    layout = "even-horizontal";
            panes = ["cd output/ && zathura Mathematik.pdf" "rebuild"];
          }
        ];
      };
      OsmApp = {
        root_dir = "~/SoftwareDevelopment/web/osmapp/";
        windows = [
          {
            name = " Neovim";
            panes = ["nvim"];
          }
          {
            name = "Server";
            panes = ["yarn dev" "echo OsmApp"];
          }
        ];
      };
      aoc = {
        root_dir = "~/SoftwareDevelopment/AdventOfCode/";
        template = "baseDev";
      };
      talks = {
        root_dir = "~/talks/";
        template = "baseDev";
      };
    };
  }
