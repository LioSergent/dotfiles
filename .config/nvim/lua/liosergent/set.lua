vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 5

vim.opt.updatetime=50

vim.opt.colorcolumn = "100"
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.py",
        group = "AutoFormat",
        callback = function()
            -- vim.lsp.buf.format {async = true}
            vim.cmd("silent !ruff format --quiet %")
            vim.cmd("silent !ruff ckeck --select I --fix --quiet %")
            -- vim.cmd("silent !black --quiet %")
            -- vim.cmd("edit")
        end,
    }
)

