-- ========================================
-- 文件名：option.lua
-- 作者：J0han9
-- 创建日期：20250106
-- 描述：neovim Option
-- ========================================

vim.g.loaded_perl_provider = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.o.hlsearch = true  -- 高亮所有匹配的搜索结果
vim.o.incsearch = true -- 实时显示搜索匹配结果
vim.opt.clipboard = "unnamedplus"  -- 系统剪贴板同步
vim.opt.mouse = "a"                -- 启用鼠标
vim.opt.cursorline = true          -- 高亮当前行
vim.opt.ignorecase = true          -- 搜索忽略大小写
vim.opt.smartcase = true           -- 智能大小写

-- 启用 Kitty 键盘协议
if vim.env.TERM == 'xterm-kitty' then
  vim.cmd([[autocmd UIEnter * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[>1u") | endif]])
  vim.cmd([[autocmd UILeave * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[<1u") | endif]])
end

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'rounded',
            source = 'always',  -- 显示错误来源（例如 lua_ls）
            prefix = ' ',
            scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
    end
})

-- 设置悬停延迟时间（毫秒）
vim.opt.updatetime = 300  -- 300ms 后触发
