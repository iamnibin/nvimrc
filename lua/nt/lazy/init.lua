return {

    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    "eandrju/cellular-automaton.nvim",
    "gpanders/editorconfig.nvim",
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "nvim-neotest/nvim-nio",
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({})
      end,
    },
    "nvim-tree/nvim-tree.lua"
}

