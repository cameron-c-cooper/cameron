return {
  { "sindrets/diffview.nvim",
    opts = {},
    config = function()
      vim.keymap.set('n', '<leader>gvb', '<CMD>DiffviewFileHistory<CR>', {desc = '[G]it [V]iew [B]ranch'})
      vim.keymap.set('n', '<leader>gvf', '<CMD>DiffviewFileHistory %<CR>', {desc = '[G]it [V]iew [F]ile'})
      vim.keymap.set('n', '<leader>gn', '<CMD>Neogit cwd=%:p:h<CR>', {desc = '[G]it [N]eogit for current file'})
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
      "echasnovski/mini.pick",         -- optional
    },
    config = true,
  },
}
