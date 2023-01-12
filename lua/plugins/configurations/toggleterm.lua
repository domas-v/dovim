require("toggleterm").setup({
    -- size can be a number or function which is passed the current terminal
    size = function (term)
        if term.direction == "horizontal" then
            return vim.o.lines * 0.2
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
        end
    end,
    -- size = 50,
    direction = 'vertical',
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    close_on_exit = true,
    float_opts = {
        border = 'curved',
    }
})
