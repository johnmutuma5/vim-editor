require("neo-tree").setup({
	sources = {
		"filesystem",
		"buffers",
	},
	filesystem = {
		async_directory_scan = "always",
		follow_current_file = {
			enabled = false,
			leave_dirs_open = true,
		},
		filtered_items = {
			never_show = {},
		},
	},
	enable_git_status = false,
	enable_diagnostics = false,
	git_status_async_options = {
		batch_size = 200,
		batch_delay = 100,
		max_lines = 100,
	},
})
