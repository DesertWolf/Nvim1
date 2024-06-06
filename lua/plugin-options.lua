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

--Treesitter setup
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "python", "lua", "vim", "vimdoc", "query","json", "markdown", "markdown_inline", "gitignore","gitcommit","gitattributes","git_config"  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = {  },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
