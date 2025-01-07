-- ========================================
-- 文件名：keymap.lua
-- 作者：J0han9
-- 创建日期：20250106
-- 描述：neovim 快捷键配置
-- Leader 使用空格
-- ========================================


-- ################
-- ###  Global  ###
-- ################
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ####################
-- ###  NvimTree    ###
-- ####################
-- 打开
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- 刷新
vim.keymap.set('n', 'r', ':NvimTreeRefresh<CR>', { silent = true })
-- 查找
vim.keymap.set('n', 'f', ':NvimTreeFindFile<CR>', { silent = true })
-- 创建
--vim.keymap.set('n', 'n', ':<CR>', { buffer = true, silent = true })
-- 删除
-- vim.keymap.set('n', 'd', ':<CR>', { buffer = true, silent = true })
-- 重命名
-- vim.keymap.set('n', 'rr', ':<CR>', { buffer = true, silent = true })
-- 剪切
-- vim.keymap.set('n', 'x', ':<CR>', { buffer = true, silent = true })
-- 复制
-- vim.keymap.set(
-- 粘贴
-- vim.keymap.set(
-- 打开文件夹
-- vim.keymap.set(
-- 关闭文件夹
--vim.keymap.set(
-- 关闭所有文件夹
--vim.keymap.set('n', ''
-- 上级一目录
-- vim.keymap.set(
