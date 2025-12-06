
local trouble = require('trouble')

trouble.setup({
    -- ===== 自动行为配置 =====
    auto_close = false,             -- 解决所有问题后不自动关闭
    auto_open = false,              -- 有诊断时不自动打开
    auto_preview = true,            -- 自动预览位置
    auto_refresh = true,            -- 自动刷新
    auto_jump = false,              -- 不自动跳转到项目
    auto_fold = false,              -- 不自动折叠
    
    -- ===== 模式配置 =====
    modes = {
        -- 诊断模式
        diagnostics = {
            auto_open = false,
            auto_close = false,
            auto_preview = true,
            auto_refresh = true,
            auto_jump = false,
        },
        -- LSP 模式
        lsp = {
            auto_open = false,
            auto_close = false,
            auto_preview = true,
            win = { position = 'right' },
        },
        -- 符号模式
        symbols = {
            win = { position = 'right' },
        },
    },
    
    -- ===== 窗口配置 =====
    focus = true,                   -- 打开时聚焦到 Trouble 窗口
    follow = true,                  -- 跟随光标
    indent_guides = true,           -- 显示缩进指南
    max_items = 200,                -- 最大显示项目数
    multiline = true,               -- 渲染多行消息
    pinned = false,                 -- 不固定窗口
    
    -- 窗口选项
    win = {
        type = 'split',             -- split, vsplit, float
        position = 'bottom',        -- bottom, top, left, right
        size = { height = 10 },     -- 窗口大小
        -- size = { width = 0.3 },  -- 侧边栏宽度（用于 position = right）
    },
    
    -- 预览窗口配置
    preview = {
        type = 'main',              -- main, float, split, vsplit
        scratch = true,             -- 使用 scratch buffer
    },
    
    -- ===== Colemak 友好的键位映射 =====
    keys = {
        -- === 帮助和刷新 ===
        ['?'] = 'help',                 -- 显示帮助
        ['r'] = 'refresh',              -- 刷新
        ['R'] = 'toggle_refresh',       -- 切换自动刷新
        
        -- === 关闭 ===
        ['q'] = 'close',                -- 关闭 Trouble
        ['<esc>'] = 'close',            -- Esc 关闭
        
        -- === 跳转操作 ===
        ['<cr>'] = 'jump',              -- 跳转到位置
        ['<2-leftmouse>'] = 'jump',     -- 双击跳转
        ['o'] = 'jump_close',           -- 跳转并关闭
        ['<tab>'] = 'jump',             -- Tab 也可以跳转
        
        -- === Colemak 核心导航 ===
        ['u'] = 'prev',                 -- 上一个（替代 k）
        ['e'] = 'next',                 -- 下一个（替代 j）
        ['U'] = 'first',                -- 第一个
        ['E'] = 'last',                 -- 最后一个
        ['<c-u>'] = 'prev_source',      -- 上一个来源
        ['<c-e>'] = 'next_source',      -- 下一个来源
        
        -- === 折叠操作 ===
        ['l'] = 'fold_open',            -- 打开折叠
        ['h'] = 'fold_close',           -- 关闭折叠
        ['za'] = 'fold_toggle',         -- 切换折叠
        ['zA'] = 'fold_toggle_recursive', -- 递归切换折叠
        ['zo'] = 'fold_open_recursive', -- 递归打开折叠
        ['zc'] = 'fold_close_recursive',-- 递归关闭折叠
        ['zM'] = 'fold_close_all',      -- 关闭所有折叠
        ['zR'] = 'fold_open_all',       -- 打开所有折叠
        ['zm'] = 'fold_more',           -- 增加折叠级别
        ['zr'] = 'fold_reduce',         -- 减少折叠级别
        ['zx'] = 'fold_update',         -- 更新折叠
        ['zX'] = 'fold_update_all',     -- 更新所有折叠
        ['zn'] = 'fold_disable',        -- 禁用折叠
        ['zN'] = 'fold_enable',         -- 启用折叠
        ['zi'] = 'fold_toggle_enable',  -- 切换折叠启用状态
        
        -- === 预览和悬停 ===
        ['p'] = 'preview',              -- 预览
        ['P'] = 'toggle_preview',       -- 切换预览模式
        ['K'] = 'hover',                -- 悬停信息
        
        -- === 其他操作 ===
        ['gp'] = 'jump_split',          -- 在分割窗口中打开
        ['gv'] = 'jump_vsplit',         -- 在垂直分割中打开
    },
    
    -- ===== 图标配置 =====
    icons = {
        -- 缩进指南
        indent = {
            top = '│ ',
            middle = '├╴',
            last = '└╴',
            fold_open = ' ',
            fold_closed = ' ',
            ws = '  ',
        },
        
        -- 文件夹图标
        folder_closed = ' ',
        folder_open = ' ',
        
        -- 符号类型图标
        kinds = {
            Array = ' ',
            Boolean = '󰨙 ',
            Class = ' ',
            Constant = '󰏿 ',
            Constructor = ' ',
            Enum = ' ',
            EnumMember = ' ',
            Event = ' ',
            Field = ' ',
            File = ' ',
            Function = '󰊕 ',
            Interface = ' ',
            Key = ' ',
            Method = '󰊕 ',
            Module = ' ',
            Namespace = '󰦮 ',
            Null = ' ',
            Number = '󰎠 ',
            Object = ' ',
            Operator = ' ',
            Package = ' ',
            Property = ' ',
            String = ' ',
            Struct = '󰆼 ',
            TypeParameter = ' ',
            Variable = '󰀫 ',
        },
    },
    
    -- ===== 格式化配置 =====
    -- 自定义格式化函数
    formatters = {
        -- 诊断格式化
        diagnostic = function(item)
            return {
                item.source,
                item.code,
                item.message,
            }
        end,
    },
    
    -- ===== 过滤和排序 =====
    -- 诊断严重程度过滤
    -- filter = {
    --     severity = vim.diagnostic.severity.ERROR,  -- 只显示错误
    -- },
    
    -- 排序优先级
    -- sort = { 'severity', 'filename', 'pos' },
})

-- ===== 自动命令配置 =====

local group = vim.api.nvim_create_augroup('TroubleConfig', { clear = true })

-- 打开 Trouble 时的自动命令
vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = 'trouble',
    callback = function(event)
        -- 禁用行号（可选）
        -- vim.wo.number = false
        -- vim.wo.relativenumber = false
        
        -- 设置本地键位映射（如果需要额外的）
        local opts = { buffer = event.buf, silent = true }
        
        -- 可以添加额外的 buffer 本地键位
        -- vim.keymap.set('n', '<C-c>', '<cmd>close<cr>', opts)
    end,
})

-- ===== 自定义命令 =====

-- 快速打开特定类型的诊断
vim.api.nvim_create_user_command('TroubleErrors', function()
    require('trouble').open({
        mode = 'diagnostics',
        filter = { severity = vim.diagnostic.severity.ERROR }
    })
end, { desc = 'Show only errors in Trouble' })

vim.api.nvim_create_user_command('TroubleWarnings', function()
    require('trouble').open({
        mode = 'diagnostics',
        filter = { severity = vim.diagnostic.severity.WARN }
    })
end, { desc = 'Show only warnings in Trouble' })

-- 切换 Trouble 窗口位置
vim.api.nvim_create_user_command('TroubleTogglePosition', function()
    local current_position = trouble.config.win.position
    local new_position = current_position == 'bottom' and 'right' or 'bottom'
    
    trouble.setup({ win = { position = new_position } })
    vim.notify('Trouble position: ' .. new_position, vim.log.levels.INFO)
end, { desc = 'Toggle Trouble window position' })

-- ===== 实用函数 =====

-- 获取诊断统计
local function get_diagnostic_counts()
    local counts = {
        errors = 0,
        warnings = 0,
        info = 0,
        hints = 0,
    }
    
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
            local diagnostics = vim.diagnostic.get(buf)
            for _, diag in ipairs(diagnostics) do
                if diag.severity == vim.diagnostic.severity.ERROR then
                    counts.errors = counts.errors + 1
                elseif diag.severity == vim.diagnostic.severity.WARN then
                    counts.warnings = counts.warnings + 1
                elseif diag.severity == vim.diagnostic.severity.INFO then
                    counts.info = counts.info + 1
                elseif diag.severity == vim.diagnostic.severity.HINT then
                    counts.hints = counts.hints + 1
                end
            end
        end
    end
    
    return counts
end

-- 显示诊断统计
vim.api.nvim_create_user_command('TroubleStats', function()
    local counts = get_diagnostic_counts()
    local msg = string.format(
        '诊断统计:\n错误: %d\n警告: %d\n信息: %d\n提示: %d',
        counts.errors,
        counts.warnings,
        counts.info,
        counts.hints
    )
    vim.notify(msg, vim.log.levels.INFO)
end, { desc = 'Show diagnostic statistics' })

-- ===== 智能诊断导航 =====

-- 跳转到下一个错误（优先级：Error > Warn > Info > Hint）
_G.trouble_next_item = function()
    if require('trouble').is_open() then
        require('trouble').next({ skip_groups = true, jump = true })
    else
        vim.diagnostic.goto_next({
            severity = { min = vim.diagnostic.severity.HINT },
            wrap = true,
        })
    end
end

-- 跳转到上一个错误
_G.trouble_prev_item = function()
    if require('trouble').is_open() then
        require('trouble').prev({ skip_groups = true, jump = true })
    else
        vim.diagnostic.goto_prev({
            severity = { min = vim.diagnostic.severity.HINT },
            wrap = true,
        })
    end
end

-- ===== 状态栏集成（可选）=====

-- 获取诊断状态（用于 lualine）
_G.trouble_status = function()
    if require('trouble').is_open() then
        return ' Trouble'
    end
    return ''
end

-- 获取诊断图标和数量（用于 lualine）
_G.trouble_diagnostic_counts = function()
    local counts = get_diagnostic_counts()
    local result = ''
    
    if counts.errors > 0 then
        result = result .. ' ' .. counts.errors
    end
    if counts.warnings > 0 then
        result = result .. ' ' .. counts.warnings
    end
    
    return result
end

-- ===== 高亮组配置（可选）=====

-- 自定义 Trouble 的颜色（如果需要）
-- vim.api.nvim_create_autocmd('ColorScheme', {
--     group = group,
--     callback = function()
--         vim.api.nvim_set_hl(0, 'TroubleNormal', { link = 'Normal' })
--         vim.api.nvim_set_hl(0, 'TroubleNormalNC', { link = 'NormalNC' })
--     end,
-- })
