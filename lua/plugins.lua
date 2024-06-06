-- i use vimplug to manage my plugins

-- this checks if vimplug is installed, if not install it
vim.cmd([[
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
]])

-- assign variable
local Plug = vim.fn['plug#']

-- in between this we call Plug to specify plugins
vim.call('plug#begin', '~/.config/nvim/plugged')
    -- fuzzy finder
    Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install()'] })
    Plug('junegunn/fzf.vim')

    -- vscode extension provider
    Plug 'neoclide/coc.nvim'

    -- display buffers and tabs nicely
    Plug 'akinsho/bufferline.nvim'

    -- color theme / sheme
    Plug('folke/tokyonight.nvim', { branch = 'main' })

    -- comment helper
    Plug 'tpope/vim-commentary'

    -- status line
    Plug 'nvim-lualine/lualine.nvim'

    -- icons for everything, file explorer, tabs, statusline
    Plug 'nvim-tree/nvim-web-devicons'

    -- file explorer
    Plug 'nvim-tree/nvim-tree.lua'


    -- Conda helper
    Plug "nvim-lua/plenary.nvim"
    Plug "kmontocam/nvim-conda"   

    --Codeium code assist
    Plug ('Exafunction/codeium.vim', { branch = 'main' })

    -- automatically add "([ pairs if first one is typed
    Plug 'jiangmiao/auto-pairs'


    -- startup interface
    Plug 'mhinz/vim-startify'
vim.call('plug#end')
