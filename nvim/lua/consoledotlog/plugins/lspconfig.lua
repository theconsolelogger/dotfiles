-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

-- PHP
require('lspconfig').intelephense.setup({})

-- Phpactor
require('lspconfig').phpactor.setup({
    on_attach = on_attach,
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    }
})

-- Vue, JavaScript, TypeScript
require('lspconfig').volar.setup({
  -- Enable "Take Over Mode" where volar will provide all JS/TS LSP services
  -- This drastically improves the responsiveness of diagnostic updates on change
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

-- Tailwind CSS
require('lspconfig').tailwindcss.setup({})

-- null-ls
require('null-ls').setup({
  sources = {
    require('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    require('null-ls').builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.formatting.prettierd,
  },
})

require('mason-null-ls').setup({ automatic_installation = true })

-- Keymaps
vim.keymap.set('n', '<space>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<space>r', "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
vim.keymap.set('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<space>i', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', '<space>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.keymap.set('n', '<space>t', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

-- Commands
vim.api.nvim_create_user_command('Format', vim.lsp.buf.formatting, {})

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  }
})

-- Sign configuration
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
