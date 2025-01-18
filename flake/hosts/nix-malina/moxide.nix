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
    Dotfiles = {
      root_dir = "~/Dotfiles/";
      template = "nvim";
    };
  };
}
