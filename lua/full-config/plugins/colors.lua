require("tokyonight").setup({
	-- transparent = true,
    style = "night",
	styles = {
	comments = "italic",
		keywords = "italic",
		functions = "bold",
		variables = "NONE",
		-- sidebars = "transparent", -- style for sidebars, see below
		-- floats = "transparent", -- style for floating windows
	},
})

vim.cmd.colorscheme("tokyonight")
