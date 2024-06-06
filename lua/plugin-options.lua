-- set colorsheme
vim.cmd([[colorscheme tokyonight-night]])

-- define fzf config, window size, preview using bat, etc
vim.cmd([[let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.9}}]])
vim.cmd([[let $FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"]])


-- bufferline config
require("bufferline").setup{
    options = {
        -- only display tabs, hide buffers
        mode = "buffers",
        -- style for kitty terminal
        separator_style = "slant",
        -- display coc diagnostics
        diagnostics = "coc"
    }
}

-- nvim tree setup
require("nvim-tree").setup()


-- lualine setup
require("lualine").setup{
    options = {
        theme = "palenight"
    }
}


--registering :Prettier command
vim.cmd([[command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument]])
