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
  :hi GlanceBorderTop gui=underline guifg=#ededed guibg=#101623
  :hi GlanceWinBarFilepath gui=italic guibg=#131417
  :hi GlanceWinBarFilename gui=none guibg=#131417
  :hi GlanceWinBarTitle gui=none guibg=#131417

  :hi GlancePreviewBorderBottom gui=underline guifg=#eeeeee

  :hi GlanceListCursorLine gui=none guibg=#41454d
  :hi GlanceListBorderBottom gui=underline guifg=#eeeeee guibg=#14181e
  :hi GlanceListNormal gui=none guibg=#14181e
  :hi GlanceListEndOfBuffer gui=none guibg=#14181e
]])
