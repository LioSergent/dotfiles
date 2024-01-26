require("liosergent.remap")
require("liosergent.set")
require("liosergent.lazy")
require("liosergent.cmp")
require("liosergent.telescope")
require("liosergent.treesitter")
require("liosergent.lsp")
require("liosergent.colorscheme")
require("liosergent.rainbow")
require("bufferline").setup{}
require("ibl").setup(
{
       indent = { char = "│" },
       scope = { show_start = false, show_end = false}
})
require("liosergent.nvim-tree")
