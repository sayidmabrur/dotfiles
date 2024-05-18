# My Linux Dotfiles

## Kitty Terminal


```
pacman -S kitty
```

Kitty is customizeable terminal for Linux. It's easier to customize terminal with kitty.

This is my kitty configuration. Nothing is really configured. Only the font size and style so it's matched with my display.

![image](https://github.com/sayidmabrur/dotfiles/assets/139939823/94f99d12-e03e-472d-9f90-3675e084e141)


<hr>

## Neovim

```
pacman -S neovim
```

Neovim is a Vim-based text editor engineered for extensibility and usability, to encourage new applications and contributions. <a href="https://neovim.io/charter/">read more here.</a>

This is my Neovim manual config, all codes are written in lua.
- colorcsheme : TokyoNight Moon.
- alpha.nvim for better UI when nvim first opened.
- Lazy.nvim for plugin manager for better performance.
- Mason.nvim for easier managing lsp, formatter, linters etc.
- heirline.nvim for customize statusline, winbar, tabline etc.
- neo-tree.nvim for better visualization file system.
- treesitter.nvim for better syntax highlighting, indentation etc.
- telescope.nvim for better finding file. (for better and maximize the feature of telescope, can install `ripgrep` from <a href="https://formulae.brew.sh/formula/ripgrep">homebrew</a>)

![image](https://github.com/sayidmabrur/dotfiles/assets/139939823/0fc5b24e-7d14-43e0-b85f-863dccc39af9)
![Screenshot from 2024-05-18 09-56-01](https://github.com/sayidmabrur/dotfiles/assets/139939823/37c66370-ec93-4d2c-be0b-ca408dced516)

