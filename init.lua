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

vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v', 'x'}, '<leader>d', '"+d')

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.pack.add({
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/nvzone/showkeys" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/unblevable/quick-scope" },
	{ src = "https://github.com/xixiaofinland/sf.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/hrsh7th/cmp-buffer" },
	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/hrsh7th/cmp-cmdline" },
	{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
})


require("mason").setup()
require("showkeys").setup({ position = "top-right" })
require("mini.pick").setup()
require("oil").setup({
	view_options = {
		show_hidden = true,
	}
})

require('sf').setup({
  enable_hotkeys = false, -- false bc of potential conflicts with custom bindings
})
local sf = require('sf')
vim.keymap.set("n", "<leader>sftf", sf.run_all_tests_in_this_file, { desc = "[S]ales [F]orce [T]est [F]ile" })
vim.keymap.set("n", "<leader>sftm", sf.run_current_test, { desc = "[S]ales [F]orce [T]est [M]ethod" })
vim.keymap.set("n", "<leader>sftr", sf.repeat_last_tests, { desc = "[S]ales [F]orce [T]est [R]epeat" })
vim.keymap.set("n", "<leader>sfto", sf.open_test_select, { desc = "[S]ales [F]orce [T]est [O]pen" })
vim.keymap.set("n", "<leader>sftc", sf.covered_percent, { desc = "[S]ales [F]orce [T]est [C]overage" })
vim.keymap.set("n", "<leader>sftt", sf.toggle_term, { desc = "[S]ales [F]orce [T]erminal [T]oggle" })
vim.keymap.set("n", "<leader>sfoo", sf.set_target_org, { desc = "[S]ales [F]orce [O]rganization [O]pen" })
vim.keymap.set("n", "<leader>sfol", sf.fetch_org_list, { desc = "[S]ales [F]orce [O]rganization [L]ist" })
vim.keymap.set("n", "<leader>sfst", sf.toggle_sign, { desc = "[S]ales [F]orce [S]ign [T]oggle" })
vim.keymap.set("n", "<leader>sfr", sf.retrieve, { desc = "[S]ales [F]orce [R]etrieve" })
vim.keymap.set("n", "<leader>sfsp", sf.save_and_push, { desc = "[S]ales [F]orce [S]ave & [P]ush" })
vim.keymap.set("v", "<leader>sfsq", sf.run_highlighted_soql, { desc = "[S]ales [F]orce [SQ]L" })
vim.keymap.set("v", "<leader>sfcc", sf.create_apex_class, { desc = "[S]ales [F]orce [C]reate [C]lass" })

vim.keymap.set('n', '-', '<CMD>Oil<CR>')
vim.keymap.set('n', '-', '<CMD>Oil<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

require("nightfox").setup({
	options = {
		styles = {
			comments = "italic"
		}
	}
})

vim.lsp.enable({ "lua_ls", "tinymist", "rust-analyzer", "clangd", "asm-lsp" })

require('nvim-treesitter.configs').setup({
	auto_install = true,
	highlight = {
		enable = true
	}
})

vim.cmd("ShowkeysToggle")
vim.cmd("colorscheme carbonfox")

vim.cmd(":hi statusline guibg=NONE")
vim.opt.guicursor = ""

local cmp = require("cmp")
local luasnip = require("luasnip")
luasnip.setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

cmp.setup({
	snippet = {
		expand = function(args) luasnip.lsp_expand(args.body) end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(-4),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
		{ name = 'path' },
	}),
})
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup({
	ensure_installed = { "clangd" },
	automatic_installation = true,
	handlers = {
		function(server)
			lspconfig[server].setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				on_attach = function(_, bufnr)
					local opts = { buffer = bufnr, silent = true }
					vim.keymap.set({ "n" }, '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' } )
					vim.keymap.set({ "n" }, 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' } )
					vim.keymap.set({ "n" }, 'gf', vim.lsp.buf.definition, { desc = 'Goto Definition' } )
				end
			})
		end,
	},
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-attach', {clear = true}),
	callback = function(event)
	end
})
vim.keymap.set({ "i" }, "<C-e>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })
