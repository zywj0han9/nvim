
local persistence = require('persistence')

persistence.setup({
    -- ===== 会话存储目录 =====
    dir = vim.fn.expand(vim.fn.stdpath('state') .. '/sessions/'),
    
    -- ===== 会话保存选项 =====
    options = {
        'buffers',      -- 保存所有 buffer
        'curdir',       -- 保存当前工作目录
        'tabpages',     -- 保存所有标签页
        'winsize',      -- 保存窗口大小
        'help',         -- 保存帮助窗口
        'globals',      -- 保存全局变量
        'skiprtp',      -- 跳过 'runtimepath' 和 'packpath'
        -- 'folds',     -- 可选: 保存折叠状态
    },
    
    -- ===== 高级配置 =====
    
    -- 保存前的回调函数
    pre_save = function()
        -- 在保存会话前关闭某些窗口类型
        -- 例如：关闭 nvim-tree, trouble 等
        vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
    end,
    
    -- 保存后的回调函数
    post_save = nil,
    
    -- 是否保存空会话
    save_empty = false,
    
    -- 需要会话的最小 buffer 数量
    -- need = 1,
})

-- ===== 自动命令配置 =====

-- 创建 autocmd 组
local group = vim.api.nvim_create_augroup('PersistenceGroup', { clear = true })

-- 退出 Neovim 前自动保存会话
vim.api.nvim_create_autocmd('VimLeavePre', {
    group = group,
    callback = function()
        -- 只在有实际文件时保存
        local buffers = vim.fn.getbufinfo({ buflisted = 1 })
        local has_files = false
        
        for _, buf in ipairs(buffers) do
            if buf.name ~= '' and not buf.name:match('^%w+://') then
                has_files = true
                break
            end
        end
        
        if has_files then
            require('persistence').save()
        end
    end,
    desc = 'Auto save session on exit'
})

-- 保存会话前清理特殊 buffer
vim.api.nvim_create_autocmd('User', {
    pattern = 'SessionSavePre',
    group = group,
    callback = function()
        -- 关闭 trouble
        pcall(vim.cmd, 'Trouble close')
        
        -- 关闭 spectre
        if pcall(require, 'spectre') then
            pcall(function()
                require('spectre').close()
            end)
        end
        
        -- 关闭 snacks explorer
        if pcall(require, 'snacks') then
            pcall(function()
                local wins = vim.api.nvim_list_wins()
                for _, win in ipairs(wins) do
                    local buf = vim.api.nvim_win_get_buf(win)
                    local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
                    if ft == 'snacks_explorer' then
                        vim.api.nvim_win_close(win, true)
                    end
                end
            end)
        end
        
        -- 关闭所有浮动窗口
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local config = vim.api.nvim_win_get_config(win)
            if config.relative ~= '' then
                vim.api.nvim_win_close(win, false)
            end
        end
    end,
    desc = 'Clean up before saving session'
})

-- ===== 自定义函数 =====

-- 列出所有可用的会话
vim.api.nvim_create_user_command('SessionList', function()
    local sessions_dir = vim.fn.stdpath('state') .. '/sessions/'
    local sessions = vim.fn.globpath(sessions_dir, '*', false, true)
    
    if #sessions == 0 then
        vim.notify('没有找到保存的会话', vim.log.levels.INFO)
        return
    end
    
    print('\n可用的会话:')
    for i, session in ipairs(sessions) do
        local name = vim.fn.fnamemodify(session, ':t')
        print(string.format('%d. %s', i, name))
    end
    print('\n使用 :lua require("persistence").load() 恢复会话')
end, { desc = 'List all saved sessions' })

-- 删除当前目录的会话
vim.api.nvim_create_user_command('SessionDelete', function()
    local session_file = require('persistence').current()
    if session_file and vim.fn.filereadable(session_file) == 1 then
        vim.fn.delete(session_file)
        vim.notify('已删除当前会话', vim.log.levels.INFO)
    else
        vim.notify('当前目录没有保存的会话', vim.log.levels.WARN)
    end
end, { desc = 'Delete current session' })

-- 删除所有会话
vim.api.nvim_create_user_command('SessionDeleteAll', function()
    local sessions_dir = vim.fn.stdpath('state') .. '/sessions/'
    local confirm = vim.fn.input('确认删除所有会话? (y/N): ')
    
    if confirm:lower() == 'y' then
        vim.fn.delete(sessions_dir, 'rf')
        vim.fn.mkdir(sessions_dir, 'p')
        vim.notify('已删除所有会话', vim.log.levels.INFO)
    else
        vim.notify('取消操作', vim.log.levels.INFO)
    end
end, { desc = 'Delete all sessions' })

-- 手动保存会话（带提示）
vim.api.nvim_create_user_command('SessionSave', function()
    require('persistence').save()
    vim.notify('会话已保存', vim.log.levels.INFO)
end, { desc = 'Save current session' })

-- ===== 会话恢复选择器 =====

-- 使用 vim.ui.select 选择会话
local function select_session()
    local sessions_dir = vim.fn.stdpath('state') .. '/sessions/'
    local sessions = vim.fn.globpath(sessions_dir, '*', false, true)
    
    if #sessions == 0 then
        vim.notify('没有找到保存的会话', vim.log.levels.INFO)
        return
    end
    
    local session_names = {}
    for _, session in ipairs(sessions) do
        table.insert(session_names, vim.fn.fnamemodify(session, ':t'))
    end
    
    vim.ui.select(session_names, {
        prompt = '选择要恢复的会话:',
        format_item = function(item)
            return '📁 ' .. item
        end,
    }, function(choice, idx)
        if choice then
            -- 加载选中的会话
            vim.cmd('source ' .. sessions[idx])
            vim.notify('已恢复会话: ' .. choice, vim.log.levels.INFO)
        end
    end)
end

-- 注册选择器命令
vim.api.nvim_create_user_command('SessionSelect', select_session, { 
    desc = 'Select and restore a session' 
})

-- ===== 会话信息显示 =====

-- 显示当前会话信息
vim.api.nvim_create_user_command('SessionInfo', function()
    local session_file = require('persistence').current()
    
    if session_file and vim.fn.filereadable(session_file) == 1 then
        local stat = vim.loop.fs_stat(session_file)
        local size = stat.size
        local mtime = os.date('%Y-%m-%d %H:%M:%S', stat.mtime.sec)
        
        print('\n当前会话信息:')
        print('文件: ' .. session_file)
        print('大小: ' .. size .. ' bytes')
        print('修改时间: ' .. mtime)
        print('工作目录: ' .. vim.fn.getcwd())
    else
        vim.notify('当前目录没有保存的会话', vim.log.levels.WARN)
    end
end, { desc = 'Show current session info' })

-- ===== 状态栏集成（可选）=====

-- 获取会话状态（用于 lualine 等）
_G.persistence_status = function()
    local session_file = require('persistence').current()
    if session_file and vim.fn.filereadable(session_file) == 1 then
        return '💾'  -- 有会话
    else
        return ''   -- 无会话
    end
end

-- ===== 通知配置 =====

-- 恢复会话后的通知
vim.api.nvim_create_autocmd('SessionLoadPost', {
    group = group,
    callback = function()
        vim.notify('会话已恢复 ✨', vim.log.levels.INFO)
        
        -- 刷新文件状态
        vim.cmd('checktime')
        
        -- 重新检测文件类型
        vim.cmd('filetype detect')
    end,
    desc = 'Notify after session restore'
})
