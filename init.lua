vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.showmode = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
 -- vim.opt.wrap = false
vim.g.have_nerd_font = true
vim.opt.termguicolors = true
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.winborder = "rounded"

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
  pattern = "*",
  callback = function(event)
      vim.cmd [[ TSBufEnable highlight]]
  end
})

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {import = 'plugins'},
})

vim.opt.guicursor = ""
