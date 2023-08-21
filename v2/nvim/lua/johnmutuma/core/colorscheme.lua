-- colorscheme
local globl = vim.g

globl.sonokai_enable_italic = true
local success, _ = pcall(vim.cmd, "colorscheme monokai_soda")

if not success then
	print("Colorscheme not found")
	return
end
