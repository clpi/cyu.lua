# cyu.lua 

<div align="center">
    <img src="./res/luacmp.png" alt="preview of lua code" style="image-rendering: crisp-edges; object-position: center; width: 100%; height: auto; object-fit: cover;border: solid 1px #bbb; object-fit: fill;"/>
</div>

<big>A simple, darker, ayu-based colorscheme for Neovim in particular, and a few other editors.</Big>
- For history buffs, this is a Neovim theme in Lua which roughly follows the ayu colorset while trying to make the extra Treesitter parsing show all the colors I believe it is truly worth, for all the wonderful plugins it's worth.
- It's an ayu-based them, intended to be a personal theme I can continually modify and tweak over time. The repo itself is almost fully based on the (excellent) [tokyonight.nvim][tokyonight] theme and Github repo. The cuurrent end-product is something which looks vaguely colorful and resembles its inspiration Ayu ever-so-vaguely... I think?


## Installation
- Installation and configuration are near identical to tokyonight at the moment, but not all flavors or color palette variations are implemented yet. Still, installation instructions remain the same.

- If you're using [packer.nvim][packer], just copy this code into wherever you keep your packer startup function:

```lua
use "clpi/cyu.lua"
```

- Or in VimL (with [plug.vim](https://github.com/junegunn/vim-plug)):
```vim
Plug 'clpi/cyu.lua'
```

- **Note**: haven't tried using the theme in Vim itself yet, only Neovim 0.7
 


## Configuration
- Configuration is borrowed from tokyonight.nvim (as an artefact of using its repo as a base template), however no different color variations have been made, so, for the time being, configuration options have been made available to the end user to provide them an illusory feeling of power and control.
- This can be achieved through the Lua API (in Neovim 0.5+):_
```lua
use  { 
    "clpi/cyu.lua",
    config = function()
        vim.g.cyu_style = "night" -- Only palette variant available right now
        vim.g.cyu_italic_functions = true
        vim.g.cyu_sidebars = {}  -- Specify window types to shade differentially
    end
}
-- ... (after packer startup) ...
vim.cmd[[ colorscheme cyu ]]
    
```


- In VimL:
```vim
Plug 'clpi/cyu.lua'

" ... after plugin spec ...

let g:cyu_style = "night"
let g:cyu_style_functions = true
let g:cyu_sidebars = {}

colorscheme cyu
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
    - [lualine]()
    - [lightline]()
    - ...and friends


![Preview for cyu]("./res/cmp.png")
<!-- <div align="center"> -->
<!--     <img  -->
<!--         src="./res/cmp.png"  -->
<!--         alt="preview for cyu"  -->
<!--         style="image-rendering:crisp-edges;  -->
<!--                object-position: center;  -->
<!--                border-radius: 3px; -->
<!--                width: 100%; height: auto;  -->
<!--                object-fit: cover; -->
<!--                border: solid 1px #bbb;  -->
<!--                object-fit: fill;" -->
<!--     /> -->
<!-- </div> -->

## Misc
- Other features...

![Preview for cyu in helix]("./res/hxtheme.png")

- If you have any [issues][issues] or want any particular plugin supported please feel free to [reach out][issues]!

- Looking to try to bring my brand of ayu-inspired flavorings to all other sorts of programs in neat fancy packages, maybe it won't be just me excited for that small fact! 
- Others, really just.. one of you, I would really call into question the ability for a vim colorscheme to and i quote "bring about the most immediate foul and dread upon this household the likes I have not seen ever before" this just doesnot sound like the sort of terror and existential horror that should be spoken of with the likes of with my personal vim colorscheme.
- All the rest of you, I love working with this colorscheme and the source code may be inspected at your leasure for any such "foul" or "untoward" practices, but uh, have fun!



  [issues]: https://github.com/grantwinney/BlogCodeSamples/issues
  [tokyonight]: https://github.com/folke/tokyonight.nvim
  [packer]: https://github.com/wbthomason/packer.nvim
