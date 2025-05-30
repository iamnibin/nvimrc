vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format { async = true }
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
  "n",
  "<leader>ee",
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/nt/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)


local function clear_cmdarea()
  vim.defer_fn(function()
    vim.api.nvim_echo({}, false, {})
  end, 800)
end

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    local buftype = vim.bo.buftype
    local filetype = vim.bo.filetype
    if filetype == "fugitive" or buftype == "terminal" then
      return
    end


    if #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
      vim.cmd "silent w"

      local time = os.date "%I:%M %p"

      -- print nice colored msg
      vim.api.nvim_echo({ { "💾", "LazyProgressDone" }, { " file autosaved at " .. time } }, false, {})

      clear_cmdarea()
    end
  end,
})

vim.api.nvim_set_keymap('n', '<leader>co?', '<cmd>CodeCompanion<cr>',
  { noremap = true, silent = true, desc = "CodeCompanion: Ask question" })
vim.api.nvim_set_keymap('v', '<leader>co?', '<cmd>CodeCompanion<cr>',
  { noremap = true, silent = true, desc = "CodeCompanion: Ask question (selection)" })
vim.api.nvim_set_keymap('v', '<leader>cor', '<cmd>CodeCompanion refactor<cr>',
  { noremap = true, silent = true, desc = "CodeCompanion: Refactor selection" })
vim.api.nvim_set_keymap('v', '<leader>coe', '<cmd>CodeCompanion explain<cr>',
  { noremap = true, silent = true, desc = "CodeCompanion: Explain selection" })
vim.api.nvim_set_keymap('v', '<leader>cot', '<cmd>CodeCompanion test<cr>',
  { noremap = true, silent = true, desc = "CodeCompanion: Generate tests for selection" })
vim.api.nvim_set_keymap('n', '<leader>cot', '<cmd>CodeCompanion test<cr>',
  { noremap = true, silent = true, desc = "CodeCompanion: Generate tests for buffer" })
vim.api.nvim_set_keymap('v', '<leader>cod', '<cmd>CodeCompanion doc<cr>',
  { noremap = true, silent = true, desc = "CodeCompanion: Generate documentation for selection" })
vim.api.nvim_set_keymap('n', '<leader>cod', '<cmd>CodeCompanion doc<cr>',
  { noremap = true, silent = true, desc = "CodeCompanion: Generate documentation for buffer" })
vim.api.nvim_set_keymap('n', '<leader>coc', '<cmd>CodeCompanion chat<cr>',
  { noremap = true, silent = true, desc = "CodeCompanion: Open chat window" })
