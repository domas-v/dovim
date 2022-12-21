require("tokyonight").setup({
	transparent = true,
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value `:help attr-list`
	comments = "italic",
		keywords = "italic",
		functions = "bold",
		variables = "NONE",
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "transparent", -- style for sidebars, see below
		floats = "transparent", -- style for floating windows
	},
})

vim.cmd.colorscheme("tokyonight")
