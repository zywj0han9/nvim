local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    })
end

vim.opt.runtimepath:prepend(lazypath)

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
    return
end

-- Setup lazy.nvim
require("lazy").setup('plugins.list')

-- theme set
vim.cmd([[colorscheme tokyonight-night]])

