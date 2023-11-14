local globl = vim.g

-- disable netrw at the very start of your init.lua
globl.loaded_netrw = 1
globl.loaded_netrwPlugin = 1

-- settings or options

local success, nvimTree = pcall(require, "nvim-tree")
if not success then
	print("nvim-tree failed to load")
	return
end

nvimTree.setup({
	git = {
		enable = false,
	},
	update_focused_file = {
		enable = true,
		update_root = true,
		update_cwd = true,
		ignore_list = { "node_modules" },
	},
	view = {
		width = 45,
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
	},
})

vim.cmd([[
  :hi NvimTreeCursorLine guibg=#444548
]])

if vim.opt.background:get() == "light" then
	vim.cmd([[
    :hi NvimTreeCursorLine guibg=#c1c1c1 guifg=white
  ]])
end
