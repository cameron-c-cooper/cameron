return {
  'xixiaofinland/sf.nvim',

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'ibhagwan/fzf-lua', -- no need if you don't use listing metadata feature
  },

  config = function()
    require('sf').setup({
      enable_hotkeys = false, -- false bc of potential conflicts with custom bindings
    })  -- Important to call setup() to initialize the plugin!
    local Sf = require('sf')
    vim.keymap.set("n", "<leader>sftf", Sf.run_all_tests_in_this_file, { desc = "[S]ales [F]orce [T]est [F]ile" })
    vim.keymap.set("n", "<leader>sftm", Sf.run_current_test, { desc = "[S]ales [F]orce [T]est [M]ethod" })
    vim.keymap.set("n", "<leader>sftr", Sf.repeat_last_tests, { desc = "[S]ales [F]orce [T]est [R]epeat" })
    vim.keymap.set("n", "<leader>sfto", Sf.open_test_select, { desc = "[S]ales [F]orce [T]est [O]pen" })
    vim.keymap.set("n", "<leader>sftc", Sf.covered_percent, { desc = "[S]ales [F]orce [T]est [C]overage" })
    vim.keymap.set("n", "<leader>sftt", Sf.toggle_term, { desc = "[S]ales [F]orce [T]erminal [T]oggle" })

    vim.keymap.set("n", "<leader>sfoo", Sf.set_target_org, { desc = "[S]ales [F]orce [O]rganization [O]pen" })
    vim.keymap.set("n", "<leader>sfol", Sf.fetch_org_list, { desc = "[S]ales [F]orce [O]rganization [L]ist" })

    vim.keymap.set("n", "<leader>sfst", Sf.toggle_sign, { desc = "[S]ales [F]orce [S]ign [T]oggle" })

    vim.keymap.set("n", "<leader>sfr", Sf.retrieve, { desc = "[S]ales [F]orce [R]etrieve" })
    vim.keymap.set("n", "<leader>sfsp", Sf.save_and_push, { desc = "[S]ales [F]orce [S]ave & [P]ush" })
    vim.keymap.set("v", "<leader>sfsq", Sf.run_highlighted_soql, { desc = "[S]ales [F]orce [SQ]L" })

    vim.keymap.set("v", "<leader>sfcc", Sf.create_apex_class, { desc = "[S]ales [F]orce [C]reate [C]lass" })
    

  end
}
