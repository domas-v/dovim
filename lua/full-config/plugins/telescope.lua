local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--trim',
		},
		mappings = {
			i = {
				["<c-j>"] = actions.move_selection_next,
				["<c-k>"] = actions.move_selection_previous,
				["<c-d>"] = actions.delete_buffer,
				["<c-l>"] = actions.preview_scrolling_down,
				["<c-h>"] = actions.preview_scrolling_up,
			},
			n = {
				["<j>"] = actions.move_selection_next,
				["<k>"] = actions.move_selection_previous,
				["<c-d>"] = actions.delete_buffer,
				["<c-l>"] = actions.preview_scrolling_down,
				["<c-h>"] = actions.preview_scrolling_up,
			}
		},
		layout_strategy = "flex",
		layout_config = {
			flex = {
				flip_columns = 200,
			},
			horizontal = {
				height = 0.8,
				width = 0.8,
				preview_width = 0.65,
			},
			vertical = {
				height = 0.8,
				width = 0.6,
				preview_height = 0.4,
				preview_cutoff = 34 -- cutoff if not full mac screen
			}
		},
		sort_lastused = true,
		sorting_strategy = "ascending",
	},
	pickers = {
		current_buffer_fuzzy_find = {
			theme = "ivy",
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	}
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>", {})
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope git_files<cr>", {})
vim.keymap.set('n', '<leader>fo', "<cmd>Telescope old_files<cr>", {})
vim.keymap.set('n', '<leader>ft', "<cmd>TodoTelescope<cr>", {})
vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<cr>", {})
vim.keymap.set('n', '<leader>fk', "<cmd>Telescope keymaps<cr>", {})
vim.keymap.set('n', '<leader>F',  "<cmd>Telescope file_browser<cr>", {})
vim.keymap.set('n', '<leader><',  "<cmd>Telescope buffers<cr>", {})
-- vim.keymap.set('n', '<leader>s',  "<cmd>Telescope current_buffer_fuzzy_find<cr>", {})
vim.keymap.set('n', '<leader>s',  "<cmd>lua require'telescope.builtin'.live_grep{ search_dirs={\"%:p\"} }<cr>", {})
vim.keymap.set('n', '<leader>S',  "<cmd>Telescope live_grep<cr>", {})
