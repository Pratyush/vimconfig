-- Change Leaders
vim.g.mapleader = " "


-- Movement Keybinds
--
vim.keymap.set('n' , 'j', 'gj', {noremap = true})
vim.keymap.set('n' , 'k', 'gk', {noremap = true})
vim.keymap.set('v' , 'j', 'gj', {noremap = true})
vim.keymap.set('v' , 'k', 'gk', {noremap = true})

vim.keymap.set('' , 'H', '^', {noremap = true})
vim.keymap.set('' , 'L', '$', {noremap = true})
vim.keymap.set('v', 'L', 'g_', {noremap = true})

-- Smart Indentation
vim.keymap.set('v', '<', '<gv', {noremap = true})
vim.keymap.set('v', '>', '>gv', {noremap = true})

-- Productivity Keybinds
vim.keymap.set('n', 'Q', '<nop>', {noremap = true})
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', 'Y', 'y$', {noremap = true})
vim.keymap.set('n', 'V', 'v$', {noremap = true})


-- Split management
vim.keymap.set('n', '<leader>', '<C-w>', {})

-- Tab Movement
vim.keymap.set('n', 'K', 'gt', {})
vim.keymap.set('n', 'J', 'gT', {})


-- Remove highlighting
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


-- Split management
vim.keymap.set('n', '<leader>t', '<cmd>tabnew<CR>', {})
