local gitsigns_ok, gitsigns = pcall(require, "gitsigns")

if not gitsigns_ok then
	print("gitsigns could not be loaded")
	return
end

gitsigns.setup()
