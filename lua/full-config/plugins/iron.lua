local iron = require("iron.core")
iron.setup{
    config = {
        -- Highlights the last sent block with bold
        highlight_last = "IronLastSent",

        -- Toggling behavior is on by default.
        -- Other options are: `single` and `focus`
        visibility = require("iron.visibility").focus,

        -- Scope of the repl
        -- By default it is one for the same `pwd`
        -- Other options are `tab_based` and `singleton`
        scope = require("iron.scope").path_based,

        -- Whether the repl buffer is a "throwaway" buffer or not
        scratch_repl = false,

        -- Automatically closes the repl window on process end
        close_window_on_exit = true,
        repl_definition = {
            -- forcing a default
            python = require("iron.fts.python").ipython,
            lua = {
                command = {"lua"}
            },
            scheme = {
                command = {"guile"}
            }
        },
        repl_open_cmd = require('iron.view').right(function()
            return vim.o.columns / 2
        end),
        buflisted = true,
    },
    keymaps = {
        send_motion = "<space>ee",
        visual_send = "<space>ee",
        send_file = "<space>ef",
        send_line = "<space>el",
        send_mark = "<space>em",
        mark_motion = "<space>ec",
        mark_visual = "<space>ec",
        remove_mark = "<space>ed",
        cr = "<space>e<cr>",
        interrupt = "<space>e<space>",
        exit = "<space>eq",
        clear = "<space>cl",
    },
    highlight = {
        italic = true
    }
}

vim.keymap.set("n", "<leader>ii", "<cmd>IronReplHere<cr>")
vim.keymap.set("n", "<leader>if", "<cmd>IronFocus<cr>")
vim.keymap.set("n", "<leader>ih", "<cmd>IronHide<cr>")
