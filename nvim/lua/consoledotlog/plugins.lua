local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
    compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
     display = {
        open_fn = function()
            return require('packer.util').float({ border = 'solid' })
        end,
    },
})

local use = require('packer').use

use 'wbthomason/packer.nvim'

-- My plugins here
use 'tpope/vim-commentary'

-- onedark theme
use({
    'navarasu/onedark.nvim',
    style = 'deep',
    config = function()
        require('onedark').setup({ style = 'cool' })
        vim.cmd('colorscheme onedark')
    end,
})

-- Fuzzy finder
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  config = function()
    require('consoledotlog/plugins/telescope')
  end,
})

-- Git integration
use({
  'lewis6991/gitsigns.nvim',
  config = function()
    local git_signs = require('gitsigns').setup({ current_line_blame = true })
    vim.keymap.set('n', ']h', git_signs.next_hunk)
    vim.keymap.set('n', '[h', git_signs.prev_hunk)
    vim.keymap.set('n', '<localleader>gs', git_signs.stage_hunk)
    vim.keymap.set('n', '<localleader>gS', git_signs.undo_stage_hunk)
    vim.keymap.set('n', '<localleader>gp', git_signs.preview_hunk)
    vim.keymap.set('n', '<localleader>gb', git_signs.blame_line)
  end,
})

-- Git commands
use({
  'tpope/vim-fugitive',
  requires = 'tpope/vim-rhubarb',
})

-- Improved syntax highlighting
use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('consoledotlog/plugins/treesitter')
  end,
})

-- Language Server Protocol
use({
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    require('consoledotlog/plugins/lspconfig')
  end,
})

-- PHP Refactoring Tools
use({
  'phpactor/phpactor',
  ft = 'php',
  run = 'composer install --no-dev --optimize-autoloader',
  config = function()
    vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
    vim.keymap.set('n', '<Leader>pn', ':PhpactorClassNew<CR>')
  end,
})

-- A Status line
use({
  'nvim-lualine/lualine.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('consoledotlog/plugins/lualine')
  end,
})

use('arkav/lualine-lsp-progress')

-- Display buffers as tabs
use({
  'akinsho/bufferline.nvim',
  -- tag = "v3.x",
  requires = 'kyazdani42/nvim-web-devicons',
  after = 'onedark.nvim',
  config = function()
    require('consoledotlog/plugins/bufferline')
  end,
})

-- Display indentation lines.
use({
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('indent_blankline').setup()
  end,
})

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
