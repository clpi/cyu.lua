# cayu.nvim

## About

- `04/21/22 08:04` An ayu-based them, intended to be a personal theme I can continually modify and tweak over time. The repo itself is almost fully based on the (excellent) [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) theme and Github repo. The cuurrent end-product is something which looks vaguely colorful and resembles its inspiration Ayu ever-so-vaguely... I think?
- If you would like to add this theme to your Vim/Neovim configuration, bearing in mind that it won't be maintained like other popular themes (instead more as a personal project), here's how to do so.


## Installation
- Installation and configuration are near identical to tokyonight at the moment, but not all flavors or color palette variations are implemented yet. Still, installation instructions remain the same.

- If you're using [packer.nvim](https://github.com/wbthomason/packer.nvim), just copy this code into wherever you keep your packer startup function:

```lua
use "clpi/cayu.nvim"
```


- Or in VimL (with [plug.vim](https://github.com/junegunn/vim-plug)):
```vim
Plug 'clpi/cayu.nvim'
```

- _**Note**: haven't tried using the theme in Vim itself yet, only Neovim 0.7)_


## Configuration
- Configuration is borrowed from tokyonight.nvim (as an artefact of using its repo as a base template), however no different color variations have been made, so, for the time being, configuration options have been made available to the end user to provide them an illusory feeling of power and control.
- This can be achieved through the Lua API (in Neovim 0.5+):_
```lua
use  { 
    "clpi/cayu.nvim",
    config = function()
        vim.g.cayu_style = "night" -- Only palette variant available right now
        vim.g.cayu_italic_functions = true
        vim.g.cayu_sidebars = {}  -- Specify window types to shade differentially
    end
}
-- ... (after packer startup) ...
vim.cmd[[ colorscheme cayu ]]
    
```


- In VimL:
```vim
Plug "clpi/cayu.nvim"

" ... after plugin spec ...

let g:cayu_style = "night"
let g:cayu_style_functions = true
let g:cayu_sidebars = {}

colorscheme cayu
```


## Plugin Support

- Supports custom coloring of many themes, including all of those supported by tokyonight as well as several custom additions. A few listed:
    - [nvim-treesitter]()
    - [trouble.nvim]()
    - [telescope.nvim]()
    - [vimwiki]()
    - [neogit.nvim]()
    - [bufferline.nvim]()
    - [copilot.vim](https://github.com/github/copilot.vim.git)
    - [gitsigns.nvim]()
    - [indent-blankline.nvim]()
    - [cmp-nvim]()
    - [fzf-lua]()
    - [toggleterm-nvim]()
    - ...and friends
