# Dotfiles

My dotfiles include configuration for these programs:

- hyprland
  - hyprlock
- nvim
- tmux
- wezterm

## Abandoned configs

Configs for these programs are also included even though I don't use them (anymore):

- waybar
- kitty

## Screenshots

![Dark & light mode](./assets/screenshots/theme.png)
It is possible to quickly switch between a dark mode (Catppuccin-Mocha) and a light mode (Catppuccin-Latte).

![Hyprlock](./assets/screenshots/hyprlock.png)
The lock screen has a minimal gradient and shows the time in binary.

![Neovim lsp](./assets/screenshots/cmp.png)
NeoVim has an awesome LSP configuration. Optimized on Rust and Typescript.  
The completion menu is really pretty

![Status bar](./assets/screenshots/muxbar.png)
The status bar in tmux uses muxbar, it's very efficient, colorful and useful

## Keybindings

This aren't all but at least some keybindings:

### Hyprland

#### Programs

| Keybinding         | Action          |
| ------------------ | --------------- |
| `Super` + `Return` | Wezterm         |
| `Super` + `w`      | Firefox         |
| `Super` + `n`      | Thunar          |
| `Super` + `d`      | wofi (launcher) |

#### Screenshots

| Keybinding              | Action                          |
| ----------------------- | ------------------------------- |
| `Super` + `Shift` + `s` | Screenshot of an area           |
| `Super` + `s`           | Screenshot of the entire screen |

#### Window Management

| Keybinding                      | Action            |
| ------------------------------- | ----------------- |
| `Super` + vim motions           | Move window focus |
| `Super` + `Shift` + vim motions | Move window       |

There are way more, maybe I will document more when I am motivated enough

## Notes

I don't document which software in which version is needed. But the NeoVim needs to be at least 0.10
