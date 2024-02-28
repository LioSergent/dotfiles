local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    { "nvim-telescope/telescope.nvim",    tag = '0.1.5',      dependencies = { { 'nvim-lua/plenary.nvim' } } },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "roflolilolmao/oceanic-next.nvim"},
    { "marko-cerovac/material.nvim"},
    { 'maxmx03/solarized.nvim' },
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'tpope/vim-commentary' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'tpope/vim-surround' },
    { 'HiPhish/rainbow-delimiters.nvim' },
    -- {
        --     "L3MON4D3/LuaSnip",
        --     -- follow latest release.
        --     version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        --     -- install jsregexp (optional!).
        --     build = "make install_jsregexp"
        -- },
        -- { 'saadparwaiz1/cmp_luasnip' },
        -- { 'rafamadriz/friendly-snippets' },
        { 'SirVer/ultisnips'},
        { 'quangnguyen30192/cmp-nvim-ultisnips'},
        { "lukas-reineke/indent-blankline.nvim", main = "ibl",                                opts = {} },
        { "akinsho/bufferline.nvim",             dependencies = "nvim-tree/nvim-web-devicons" },
        {
            'freddiehaddad/feline.nvim',
            opts = {}
        },
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },
        {"untitled-ai/jupyter_ascending.vim"},
        {'lervag/vimtex'}
    })
