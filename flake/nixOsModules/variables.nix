{pkgs, ...}: {
  environment.variables = {
    EDITOR = "${pkgs.neovim}/bin/nvim";
    MANPAGER = "${pkgs.neovim}/bin/nvim +Man!";
    NH_FLAKE = "/home/dlurak/Dotfiles/flake";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };
}
