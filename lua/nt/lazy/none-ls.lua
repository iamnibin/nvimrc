return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local opts = {
            sources = {
                null_ls.builtins.formatting.prettierd,
            },
        }

        return opts
    end
}
