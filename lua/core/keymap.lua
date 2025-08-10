-- ========================================
-- 文件名：keymap.lua
-- 作者：J0han9
-- 创建日期：20250106
-- 描述：neovim 快捷键配置
-- Leader 使用空格
-- ========================================


-------------------
--- Global
-------------------
local opts = { noremap=true, silent=true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.splitbelow = true
vim.api.nvim_set_keymap('n', 'Q', ':q!<CR>', opts)
vim.api.nvim_set_keymap('n', 'q', ':q<CR>', opts)
vim.api.nvim_set_keymap('n', 'W', ':w<CR>', opts)

vim.api.nvim_set_keymap('n', '<C-e>', 'nzz', opts)
vim.api.nvim_set_keymap('n', '<C-u>', 'Nzz', opts)
vim.api.nvim_set_keymap('n', '<leader><CR>', ':noh<CR>', opts)
vim.keymap.set('v', 'Y', '"+y', opts)
vim.keymap.set('n', 'P', '"+p', opts)

-------------------
---     ↑
---     u
--- ← n   i→
---     e
---     ↓
-------------------
-- 正常模式下的映射

vim.api.nvim_set_keymap('n', 'u', 'k', opts)  -- 'i' 映射为向上移动
vim.api.nvim_set_keymap('n', 'e', 'j', opts)  -- 'k' 映射为向下移动
vim.api.nvim_set_keymap('n', 'n', 'h', opts)  -- 'j' 映射为向左移动
vim.api.nvim_set_keymap('n', 'i', 'l', opts)  -- 'l' 映射为向右移动

vim.api.nvim_set_keymap('n', 'k', 'i', opts)
vim.api.nvim_set_keymap('n', 'K', 'I', opts)
vim.api.nvim_set_keymap('n', 'm', 'o', opts)
vim.api.nvim_set_keymap('n', 'M', 'O', opts)

-- 向上5行
vim.api.nvim_set_keymap('n', 'U', '5k', opts)
vim.api.nvim_set_keymap('n', 'E', '5j', opts)
-- 最左
vim.api.nvim_set_keymap('n', 'N', '0', opts)
-- 最右
vim.api.nvim_set_keymap('n', 'I', '$', opts)
-- 插入模式下的映射
vim.api.nvim_set_keymap('i', '<C-u>', '<Up>', opts)    -- Ctrl+i 映射为向上移动
vim.api.nvim_set_keymap('i', '<C-e>', '<Down>', opts)  -- Ctrl+k 映射为向下移动
vim.api.nvim_set_keymap('i', '<C-n>', '<Left>', opts)  -- Ctrl+j 映射为向左移动
vim.api.nvim_set_keymap('i', '<C-i>', '<Right>', opts) -- Ctrl+l 映射为向右移动

-- 可视模式下的映射
vim.api.nvim_set_keymap('v', 'u', 'k', opts)  -- 'i' 映射为向上移动
vim.api.nvim_set_keymap('v', 'e', 'j', opts)  -- 'k' 映射为向下移动
vim.api.nvim_set_keymap('v', 'n', 'h', opts)  -- 'j' 映射为向左移动
vim.api.nvim_set_keymap('v', 'i', 'l', opts)  -- 'l' 映射为向右移动

vim.api.nvim_set_keymap('v', 'k', 'i', opts)
vim.api.nvim_set_keymap('v', 'K', 'I', opts)
vim.api.nvim_set_keymap('v', 'm', 'o', opts)
vim.api.nvim_set_keymap('v', 'M', 'O', opts)

-- 向上5行
vim.api.nvim_set_keymap('v', 'U', '5k', opts)
vim.api.nvim_set_keymap('v', 'E', '5j', opts)

-- 最左
vim.api.nvim_set_keymap('v', 'N', '0', opts)

-- 最右
vim.api.nvim_set_keymap('v', 'I', '$', opts)

-- 唤起终端
vim.api.nvim_set_keymap('n','<leader>/', ':new +resize10 term://fish<CR>',opts)

-- 窗口切换快捷键
vim.api.nvim_set_keymap('n', '<leader>w', '<C-W>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', '<C-W>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>i', '<C-W>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>u', '<C-W>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', '<C-W>j', { noremap = true, silent = true })

-------------------
--- NvimTree
-------------------
-- 打开
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', opts)

-------------------
--- dap cmd
-------------------
vim.api.nvim_set_keymap('n', '<F5>', "<Cmd>lua require'dap'.continue()<CR>", opts)
vim.api.nvim_set_keymap('n', '<F10>', "<Cmd>lua require'dap'.step_over()<CR>", opts)
vim.api.nvim_set_keymap('n', '<F11>', "<Cmd>lua require'dap'.step_into()<CR>", opts)
vim.api.nvim_set_keymap('n', '<F12>', "<Cmd>lua require'dap'.step_out()<CR>", opts)

-- 打断点
vim.api.nvim_set_keymap('n', '<leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap('v', '<leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
-- 删除所有断点
vim.api.nvim_set_keymap('n', '<leader>B', "<Cmd>lua require'dap'.clear_breakpoints()<CR>", opts)

-- 打开/关闭调试面板
vim.api.nvim_set_keymap('n', '<leader>r', ':DapUIToggle<CR>', opts)

-------------------
--- textsubjects
-------------------

-------------------
--- snacks
-------------------

-------------------
--- lualine
-------------------
vim.keymap.set('n', 'ti', ':bnext<CR>', opts)
vim.keymap.set('n', 'tn', ':bprevious<CR>', opts)

-------------------
--- Multicursors
-------------------
vim.keymap.set('n', '<leader>m', '<Cmd>MCstart<CR>', opts)
vim.keymap.set('v', '<leader>m', '<Cmd>MCstart<CR>', opts)

-------------------
--- Copilot Chat
-------------------

vim.api.nvim_set_keymap('n', '<leader>cc', ':CopilotChat<CR>', { noremap = true, silent = true })

