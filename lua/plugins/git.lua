return {
  "sindrets/diffview.nvim",
  opts = {},
  config = function()
    vim.keymap.set('n', '<leader>gvb', '<CMD>DiffviewFileHistory<CR>', {desc = '[G]it [V]iew [B]ranch'})
    vim.keymap.set('n', '<leader>gvf', '<CMD>DiffviewFileHistory %<CR>', {desc = '[G]it [V]iew [F]ile'})
  end

}
