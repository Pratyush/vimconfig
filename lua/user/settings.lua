vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.clipboard = "unnamedplus"
-- vim.opt.wildchar = ('<Tab>'):byte()
-- vim.opt.wildignore:append({ '*.swp', '*.pyc', '*.bak', '*.class', '.hg', '.git', '.svn', '*.log', '*.aux', '*.out', '*.toc', '*.fls', '*.bbl', '*.blg', '*.fdb_latexmk', '*.dvi', '*.synctex.gz', '*.brf', '*.pdf', '*.jpg', '*.bmp', '*.gif', '*.png', '*.jpeg', '*.o', '*.obj', '*.exe', '*.dll', '*.manifest', '*.spl', '*.sw?', '*.DS_Store', '*.luac', '*.pyc', '*.hi', '*.orig' })
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.linebreak = true
vim.opt.formatoptions:append('l')
vim.opt.colorcolumn = '79'
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.hidden = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.title = true
vim.cmd("syntax enable")
vim.cmd('filetype plugin indent on')
vim.opt.whichwrap:append {
  ['<'] = true,
  ['>'] = true,
  h = true,
  l = true,
}


-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
