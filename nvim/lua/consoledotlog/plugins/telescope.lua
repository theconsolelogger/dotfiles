local actions = require('telescope.actions')

vim.cmd([[
  highlight link TelescopePromptTitle PMenuSel
  highlight link TelescopePreviewTitle PMenuSel
  highlight link TelescopePromptNormal NormalFloat
  highlight link TelescopePromptBorder FloatBorder
  highlight link TelescopeNormal CursorLine
  highlight link TelescopeBorder CursorLineBg
]])

require('telescope').setup({
  defaults = {
    layout_strategy = 'horizontal',
    -- path_display = { truncate = 1 },
    prompt_prefix = ' 󰍉  ',
    selection_caret = ' ',
    layout_config = {
      prompt_position = 'bottom',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        -- ['<C-Down>'] = actions.cycle_history_next,
        -- ['<C-Up>'] = actions.cycle_history_prev,
      },
    },
    file_ignore_patterns = { '.git/', 'node_modules/', 'vendor/' },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    oldfiles = {
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = true,
    },
    git_status = {
        git_staging = true
    }
  },
})

require('telescope').load_extension('fzf')
-- require('telescope').load_extension('live_grep_args')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>f', builtin.find_files, {})
vim.keymap.set('n', '<Leader>F', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]])
vim.keymap.set('n', '<Leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<Leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>s', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<Leader>gr', builtin.git_status, {})
vim.keymap.set('n', '<Leader>gs', builtin.git_stash, {})
vim.keymap.set('n', '<Leader>gc', builtin.git_bcommits, {})
