local success, _ = pcall(vim.cmd, "colorscheme monokai_soda")

if not success then
  print("Colorscheme not found")
  return
end
