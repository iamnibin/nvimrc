return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            diagnostics = {
                enable = true,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        })

        vim.keymap.set("n", "<leader>el", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
    end,
}

