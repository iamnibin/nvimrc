return {
  {
    "folke/trouble.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "ryanoasis/vim-devicons",
    },
    config = function()
      require("trouble").setup({
      })

      vim.keymap.set("n", "<leader>tt", function()
        require("trouble").toggle("diagnostics")
      end)

      vim.api.nvim_set_keymap('n', '<leader>tw', '', {
        noremap = true,
        callback = function()
          for _, client in ipairs(vim.lsp.buf_get_clients()) do
            require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
          end
        end
      })
      vim.keymap.set("n", "[t", function()
        require("trouble").next({ skip_groups = true, jump = true });
      end)

      vim.keymap.set("n", "]t", function()
        require("trouble").previous({ skip_groups = true, jump = true });
      end)
    end
  },
}
