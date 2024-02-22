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
-- PLUGIN SETUP
require('lazy').setup({
  {'rhysd/clever-f.vim'}, -- Better Find
  {'lervag/vimtex', ft = 'tex'}, -- LaTeX Plugins, lazy-loaded for tex files
  {'tpope/vim-surround'},
  {'tpope/vim-repeat'},
  {'xiyaowong/fast-cursor-move.nvim'}
}, {
  -- Configuration options for lazy.nvim
})

local vscode = require('vscode-neovim')

-- KEYBINDINGS

-- Change Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Movement Keybinds
--
local function move(d)
  return function()
    -- Only works in charwise visual mode
    if vim.api.nvim_get_mode().mode ~= 'v' then return 'g' .. d end
    require('vscode-neovim').action('cursorMove', {
      args = {
        {
          to = d == 'j' and 'down' or 'up',
          by = 'wrappedLine',
          value = vim.v.count1,
          select = true,
        },
      },
    })
    return '<Ignore>'
  end
end


vim.keymap.set({ 'v' }, 'gj', move('j'), { expr = true, noremap = false })
vim.keymap.set({ 'v' }, 'gk', move('k'), { expr = true, noremap = false })
--[[ vim.api.nvim_set_keymap('n', 'j', 'gj', {})
vim.api.nvim_set_keymap('n', 'k', 'gk', {}) ]]
vim.api.nvim_set_keymap('' , 'H', '^', {noremap = true})
vim.api.nvim_set_keymap('' , 'L', '$', {noremap = true})
vim.api.nvim_set_keymap('v', 'L', 'g_', {noremap = true})

-- Smart Indentation
vim.keymap.set('v', '<', '<gv', {noremap = true})
vim.keymap.set('v', '>', '>gv', {noremap = true})

-- Productivity Keybinds
vim.keymap.set('n', 'Q', '<nop>', {noremap = true})
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', 'Y', 'y$', {noremap = true})
vim.keymap.set('n', 'V', 'v$', {noremap = true})

-- Tab Movement
vim.api.nvim_set_keymap('n', 'K', 'gt', {})
vim.api.nvim_set_keymap('n', 'J', 'gT', {})

-- LaTeX Keybinds
vim.keymap.set('n', '<leader>ll', ':VimtexCompile<CR>', {noremap = true})

-- BETTER VIM

-- Set options
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.clipboard = "unnamedplus"
-- vim.opt.wildchar = '<Tab>'
-- vim.opt.wildignore:append({ '*.swp', '*.pyc', '*.bak', '*.class', '.hg', '.git', '.svn', '*.log', '*.aux', '*.out', '*.toc', '*.fls', '*.bbl', '*.blg', '*.fdb_latexmk', '*.dvi', '*.synctex.gz', '*.brf', '*.pdf', '*.jpg', '*.bmp', '*.gif', '*.png', '*.jpeg', '*.o', '*.obj', '*.exe', '*.dll', '*.manifest', '*.spl', '*.sw?', '*.DS_Store', '*.luac', '*.pyc', '*.hi', '*.orig' })
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.keymap.set('n', '<leader><leader>', ':noh<CR>', {noremap = true, silent = true})
vim.opt.linebreak = true
vim.opt.formatoptions:append('l')
vim.opt.colorcolumn = '79'
vim.opt.wrap = false

-- Enable soft-wrapping and spell checking for text files
vim.cmd [[
  autocmd FileType mail,text,markdown,html,tex setlocal wrap
  autocmd FileType text,markdown,html,tex set spell
]]

-- Plugin specific settings
-- vim.g.surround_{char2nr('c')} = "\\\1command\1{\r}"
vim.g.tex_fast = "mMr"
vim.g.vimtex_imaps_enabled = 0
vim.g.vimtex_quickfix_enabled = 0
vim.g.vimtex_quickfix_mode = 2