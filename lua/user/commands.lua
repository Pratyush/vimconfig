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
