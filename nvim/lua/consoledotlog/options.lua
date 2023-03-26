vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.smartindent = true

vim.opt.wrap = false

-- Line number settings
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true

vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'

vim.opt.title = true
vim.opt.mouse = 'a'

vim.opt.termguicolors = true

vim.opt.spell = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = { tab = '> ', trail = '.' }
vim.opt.fillchars:append({ eob = ' ' })

vim.opt.signcolumn = 'yes:2'
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8

vim.opt.clipboard = 'unnamedplus'
vim.opt.confirm = true

vim.opt.undofile = true

vim.opt.cursorline = true
vim.opt.showmode = false
