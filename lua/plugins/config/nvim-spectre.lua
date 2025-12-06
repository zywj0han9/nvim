
local spectre = require('spectre')

spectre.setup({
    -- ===== 基础配置 =====
    color_devicons = true,              -- 启用文件图标
    open_cmd = 'vnew',                  -- 在新垂直窗口中打开
    live_update = false,                -- 禁用实时更新（手动触发更快）
    
    -- ===== 界面样式 =====
    line_sep_start = '┌─────────────────────────────────────────',
    result_padding = '│  ',
    line_sep       = '└─────────────────────────────────────────',
    
    -- ===== 高亮配置 =====
    highlight = {
        ui      = 'String',             -- UI 元素高亮
        search  = 'DiffChange',         -- 搜索结果高亮
        replace = 'DiffDelete',         -- 替换结果高亮
    },
    
    -- ===== Colemak 友好的键位映射 =====
    mapping = {
        -- === 主要操作 ===
        ['send_to_qf'] = {
            map = '<leader>q',
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = 'send all to quickfix'
        },
        ['replace_cmd'] = {
            map = '<leader>c',
            cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
            desc = 'input replace command'
        },
        ['show_option_menu'] = {
            map = '<leader>o',
            cmd = "<cmd>lua require('spectre').show_options()<CR>",
            desc = 'show options'
        },
        ['run_current_replace'] = {
            map = '<leader>rc',
            cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
            desc = 'replace current line'
        },
        ['run_replace'] = {
            map = '<leader>R',
            cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
            desc = 'replace all'
        },
        
        -- === 视图和引擎 ===
        ['change_view_mode'] = {
            map = '<leader>v',
            cmd = "<cmd>lua require('spectre').change_view()<CR>",
            desc = 'change result view mode'
        },
        ['change_replace_sed'] = {
            map = 'trs',
            cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
            desc = 'use sed to replace'
        },
        ['change_replace_oxi'] = {
            map = 'tro',
            cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
            desc = 'use oxi to replace'
        },
        
        -- === 选项切换 ===
        ['toggle_live_update'] = {
            map = 'tu',
            cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
            desc = 'update when vim writes to file'
        },
        ['toggle_ignore_case'] = {
            map = 'ti',
            cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
            desc = 'toggle ignore case'
        },
        ['toggle_ignore_hidden'] = {
            map = 'th',
            cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
            desc = 'toggle search hidden'
        },
        
        -- === 其他操作 ===
        ['resume_last_search'] = {
            map = '<leader>l',
            cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
            desc = 'resume last search'
        },
        
        -- === Colemak 导航 ===
        ['tab'] = {
            map = '<Tab>',
            cmd = "<cmd>lua require('spectre').tab()<CR>",
            desc = 'next query'
        },
        ['shift-tab'] = {
            map = '<S-Tab>',
            cmd = "<cmd>lua require('spectre').shift_tab()<CR>",
            desc = 'previous query'
        },
    },
    
    -- ===== 搜索引擎配置 (ripgrep) =====
    find_engine = {
        ['rg'] = {
            cmd = 'rg',
            args = {
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',              -- 智能大小写匹配
                '--hidden',                  -- 搜索隐藏文件
                '--glob=!.git/',             -- 排除 .git 目录
                '--glob=!node_modules/',     -- 排除 node_modules
                '--glob=!*.pyc',             -- 排除 Python 缓存
                '--glob=!*.class',           -- 排除 Java 编译文件
                '--glob=!__pycache__/',      -- 排除 Python 缓存目录
                '--glob=!.next/',            -- 排除 Next.js 构建目录
                '--glob=!.nuxt/',            -- 排除 Nuxt.js 构建目录
                '--glob=!dist/',             -- 排除构建输出目录
                '--glob=!build/',            -- 排除构建目录
            },
            options = {
                ['ignore-case'] = {
                    value = '--ignore-case',
                    icon = '[I]',
                    desc = 'ignore case'
                },
                ['hidden'] = {
                    value = '--hidden',
                    desc = 'hidden file',
                    icon = '[H]'
                },
            },
        },
    },
    
    -- ===== 替换引擎配置 (sed) =====
    replace_engine = {
        ['sed'] = {
            cmd = 'sed',
            args = nil,
            options = {
                ['ignore-case'] = {
                    value = '--ignore-case',
                    icon = '[I]',
                    desc = 'ignore case'
                },
            },
        },
    },
    
    -- ===== 默认设置 =====
    default = {
        find = {
            cmd = 'rg',
            options = { 'ignore-case' }     -- 默认忽略大小写
        },
        replace = {
            cmd = 'sed'
        },
    },
    
    -- ===== 其他配置 =====
    replace_vim_cmd = 'cdo',                -- 使用 cdo 执行替换
    is_open_target_win = true,              -- 打开目标窗口
    is_insert_mode = false,                 -- 不自动进入插入模式
})

-- ===== 自定义函数 =====

-- 搜索当前光标下的单词
vim.api.nvim_create_user_command('SpectreWord', function()
    require('spectre').open_visual({ select_word = true })
end, { desc = 'Search current word with Spectre' })

-- 在当前文件中搜索
vim.api.nvim_create_user_command('SpectreFile', function()
    require('spectre').open_file_search({ select_word = true })
end, { desc = 'Search in current file with Spectre' })

-- 搜索当前目录
vim.api.nvim_create_user_command('SpectreDir', function()
    local path = vim.fn.expand('%:p:h')
    require('spectre').open_visual({
        cwd = path,
        select_word = true
    })
end, { desc = 'Search in current directory with Spectre' })
