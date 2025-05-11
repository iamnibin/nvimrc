return {

  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({})
    local api = require("supermaven-nvim.api")
    vim.keymap.set("n", "<leader>sup", api.restart)
    vim.keymap.set("n", "<leader>psup", api.stop)
  end,
}
