-- function ColorMyPencils(color)
-- 	color = color or "t"
-- 	vim.cmd.colorscheme(color)

-- 	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
-- 	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
-- end

-- ColorMyPencils()

local colorscheme = "catppuccin"
-- local colorscheme = "material"
-- vim.g.material_style = "oceanic"
-- local colorscheme = "OceanicNext"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

