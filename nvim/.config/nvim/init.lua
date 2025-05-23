-- lazy.nvim
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
-- clipboard into nvim and out of vim 
vim.opt.clipboard = "unnamedplus"
-- text wrapping 
vim.opt.wrap = true
vim.opt.list = false -- stops displaying whitespaces as text 
vim.opt.linebreak = true -- wraps text at the end of a word 

vim.api.nvim_create_user_command('Wdate', function()
  vim.cmd([[r !date +"\%H:\%Mh \%d.\%m.\%Y"]])
end, {})

local opts = {}

require("vim-options")
require("lazy").setup("plugins", opts)
