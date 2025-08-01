I store all my dotfiles here.

# Install / Sources
INSTALL: [stow] https://formulae.brew.sh/formula/stow  
SOURCE: https://tamerlan.dev/how-i-manage-my-dotfiles-using-gnu-stow/  
SOURCE: https://www.youtube.com/watch?v=y6XCebnB9gs

# Philosopy
- I try to catalog everything I need to install via whatever appropriate
  package manager with this `INSTALL: ` marker in my dotfiles
- I try to be very intentional & explicit with my settings. I always forget
  where/why I did something so I leave verbose comments & sources via this
  `SOURCE: ` marker
- I have more markers listed below
- I try to use the "XDG Base Directory Specification" stuff whenever I can
  because it feels cleaner. This just means put dotfiles in `~/.config`
- Once I have a decent config, I should try to timebox an explicit 20-30
  minutes per week max to iterating on my devX, explore new tools, address
  todos, etc. Then every 4-6 months I should spend some time to do a deeper
  dive
- I sometimes get way too focused on perfection; I need to be okay with "good
  enough" even if it is slightly sub-optimal
- Generally, I try to deviate as little as possible from defaults, especially
  for things like keybindings

# Usage
I use GNU stow to manage dotfiles. It is a "symlink farm manager"

This repo mirrors exactly how things should look in my `$HOME` directory (`~/`)

## Dotfile set up steps
1.) check out this repo in ~/.dotfiles  
2.) run
```bash
cd ~/.dotfiles
# dryrun
stow -nv .

# run for real
stow -v .
```
which symlinks the files in this repo to the parent directory (`~/`), ignoring
things in `.stow-local-ignore`

## Find markers
```bash
cd ~/.dotfiles
rg -i --hidden 'INSTALL: '
rg -i --hidden 'TODO: '
rg -i --hidden 'SOURCE: '
rg -i --hidden 'LEARN: '
# helpful tipes to remember
rg -i --hidden 'REMEMBER: '
```

## Cleanup steps
```bash
cd ~/.dotfiles
stow -Dv .
```
deletes symlinks stow created

# Notes
- my current setup is zsh/iterm2/vscode/tmux but I am trying out
  zsh/iterm2/neovim/tmux, starting from kickstart.nvim
- kickstart.nvim: I cloned the main repo and removed the git repo to check into
  this dotfiles repo. nvim plugins live in .local/share so we don't need to
  worry about accidentally checking in the plugins
- tmux: tmux plugins live in ~/.local/share/tmux/plugins after setting
  $TMUX_PLUGIN_MANAGER_PATH. this means they also won't get checked in now, we
  just need to take special care when initially installing tpm by git cloning
  into that folder


# Manual Import/Export
Some settings like iterm2 & rectangle require manual importing/exporting, so
they aren't synced with stow

To export
```
General -> Settings -> Export All Settings and Data...
or
Search for "Load settings from a custom folder or URL"
```

# TODOs
- TODO: flesh out nvim setup
- TODO: get better at emacs keybindings in the shell
- TODO: https://scottspence.com/posts/speeding-up-my-zsh-shell
- TODO: explore bat & other alternatives [here](https://www.reddit.com/r/linux/comments/9b2ort/comment/e4zy7lu/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
- TODO: maybe: try emacs later on
- TODO: maybe: try out different terminal emulators (kitty? alacritty?)
- TODO: maybe: try out different package managers (nix?)
- TODO: maybe: export vscode setup just for posterity

- TODO: [nit] ctrl+b requires double input; this is because ctrl + b is the default tmux prefix; not sure what to do here will just live with it for now
- TODO: [nit] ctrl+n/ctrl+p has slightly different behavior from up/down arrow in search wrt partial commands. is there a way to resolve this?

- TODO: [nit] split up zshrc into smaller files (1 for fzf/aliases etc); also for custom company configs
- TODO: [nit] annotate computer/setup specific settings like git email
