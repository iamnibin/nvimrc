local trim_spaces = true
vim.keymap.set("v", "<space>s", function()
    require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
end)
vim.keymap.set('n', '<leader>tm', function()
    require("toggleterm").toggle()
end)
return  {'akinsho/toggleterm.nvim', version = "*", config = true}

