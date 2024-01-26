vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "H", "^")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("n", "<leader>f=", "gg<S-v>G=")
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

vim.keymap.set("n", "<leader>e", ":bnext<CR>")
vim.keymap.set("n", "<leader>a", ":bprevious<CR>")

-- Close buffer, I had something a 
-- vim.keymap.set("n", "<leader>c", ":bp\\|bd #<CR>"), maybe will need to do something more complicated
vim.keymap.set("n", "<leader>c", ":bd<CR>")

vim.keymap.set("n", "<C-a>", "ggVG")

vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

vim.keymap.set("n", "<A-z>", "<C-w>")


vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "<Plug>JupyterExecute")
vim.keymap.set("n", "<leader>X", "<Plug>JupyterExecuteAll")


