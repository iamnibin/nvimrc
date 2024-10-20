local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<leader>fl', api.tree.change_root_to_parent,        opts('Up'))
end

-- pass to setup along with your other options
return {
  "nvim-tree/nvim-tree.lua",
  on_attach = on_attach,
  ---
}
