-- Lua configuration
local glance = require("glance")
-- local actions = glance.actions
glance.setup({
	border = {
		enable = true,
		top_char = " ",
		bottom_char = " ",
	},
})

vim.cmd([[
  :hi GlanceBorderTop gui=underline guifg=#ededed guibg=#10110A

  :hi GlanceWinBarFilepath gui=italic guibg=#14140F
  :hi GlanceWinBarFilename gui=none guibg=#14140F
  :hi GlanceWinBarTitle gui=none guibg=#14140F

  :hi GlancePreviewBorderBottom gui=underline guifg=#eeeeee

  :hi GlanceListCursorLine gui=none guibg=#656661

  :hi GlanceListBorderBottom gui=underline guifg=#eeeeee "guibg=#1D1D1D
  " :hi GlanceListNormal gui=none guibg=#1D1D1D
  " :hi GlanceListEndOfBuffer gui=none guibg=#1D1D1D
]])
