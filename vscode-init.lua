local vscode = require('vscode-neovim')
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
  {'tpope/vim-commentary'},
  {'tpope/vim-surround'},
  {'tpope/vim-repeat'},
  -- {'xiyaowong/fast-cursor-move.nvim'}
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


vim.keymap.set({ 'v' }, 'gj', move('j'), { expr = true, noremap = true })
vim.keymap.set({ 'v' }, 'gk', move('k'), { expr = true, noremap = true })
vim.api.nvim_set_keymap('n' , 'j', 'gj', {})
vim.api.nvim_set_keymap('n' , 'k', 'gk', {})
-- vim.api.nvim_set_keymap('v' , 'j', 'gj', {noremap = true})
-- vim.api.nvim_set_keymap('v' , 'k', 'gk', {noremap = true})

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

vim.keymap.set('n', '<leader><leader>', ':noh<CR>', {noremap = true, silent = true})
-- LaTeX Keybinds
local function latex_compile()
  vscode.call('latex-workshop.build')
end
local function latex_synctex()
  vscode.call('latex-workshop.synctex')
end
local function latex_clean()
  vscode.call('latex-workshop.clean')
end
vim.keymap.set('n', '<leader>ll', latex_compile, {expr=true, noremap = true})
vim.keymap.set('n', '<leader>lv', latex_synctex, {expr=true, noremap = true})
vim.keymap.set('n', '<leader>lc', latex_clean, {expr=true, noremap = true})

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
vim.opt.linebreak = true
vim.opt.formatoptions:append('l')
vim.opt.colorcolumn = '79'
vim.opt.wrap = false
vim.opt.breakindent = true
vim.cmd("syntax off")
vim.opt.whichwrap:append {
  ['<'] = true,
  ['>'] = true,
  h = true,
  l = true,
}

-- Enable soft-wrapping and spell checking for text files

-- Set wrap for specific file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"mail", "text", "markdown", "html", "tex"},
  callback = function() vim.opt_local.wrap = true end,
})

-- Enable spell checking for specific file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"text", "markdown", "html", "tex"},
  callback = function() vim.opt_local.spell = true end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  command = "set iskeyword+=^_",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  command = "set iskeyword+=^:",
})

-- Plugin specific settings
vim.g.tex_fast = "mMr"
vim.g.vimtex_imaps_enabled = 0
vim.g.vimtex_quickfix_enabled = 0
vim.g.vimtex_quickfix_mode = 2
vim.g.vimtex_disable_directory_scan_main_file_detection = 0
