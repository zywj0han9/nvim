local Snacks = require('snacks')
local icons = require('lib.icons')

Snacks.setup({
	picker = {
		enabled = true,
		sources = {
            explorer = {
                -- ===== 外观和行为 =====
                follow_file = true,        -- 自动跟随当前文件
                show_hidden = false,       -- 默认不显示隐藏文件
                
                -- ===== 窗口配置 =====
                win = {
                    -- Input 窗口(路径输入栏)的键位
                    input = {
                        keys = {
                            ["<Esc>"] = "close",
                        },
                    },
                    
                    -- List 窗口(文件列表)的键位 - 这是关键!
                    list = {
                        keys = {
                            -- === Colemak 核心导航 ===
                            ["u"] = "list_up",         -- 向上
                            ["e"] = "list_down",       -- 向下
                            ["U"] = "list_top",        -- 跳到顶部
                            ["E"] = "list_bottom",     -- 跳到底部
                            
                            -- === 文件/目录操作 ===
                            ["i"] = "confirm",         -- 打开文件/进入目录
                            ["l"] = "confirm",         -- 同上(额外的 Colemak 友好键)
                            ["<CR>"] = "confirm",      -- 回车也能用
                            ["n"] = "explorer_close",  -- 关闭目录节点
                            ["h"] = "explorer_close",  -- 同上
                            ["<BS>"] = "explorer_up",  -- Backspace 返回上级
                            
                            -- === 分割窗口打开 ===
                            ["v"] = "vsplit",          -- 垂直分割
                            ["s"] = "split",           -- 水平分割
                            ["t"] = "tab",             -- 新标签页
                            
                            -- === 文件管理 ===
                            ["a"] = "explorer_add",    -- 新建文件/目录
                            ["d"] = "explorer_del",    -- 删除
                            ["r"] = "explorer_rename", -- 重命名
                            ["x"] = "explorer_cut",    -- 剪切
                            ["c"] = "explorer_copy",   -- 复制
                            ["p"] = "explorer_paste",  -- 粘贴
                            
                            -- === 复制路径 ===
                            ["y"] = "copy_name",       -- 复制文件名
                            ["Y"] = "copy_path",       -- 复制相对路径
                            ["gy"] = "copy_absolute_path", -- 复制绝对路径
                            
                            -- === 其他操作 ===
                            ["R"] = "refresh",         -- 刷新
                            ["H"] = "toggle_hidden",   -- 切换隐藏文件
                            ["."] = "toggle_hidden",   -- 同上
                            ["?"] = "help",            -- 帮助
                            ["q"] = "close",           -- 关闭 explorer
                            ["<Esc>"] = "close",       -- Esc 关闭
                            
                            -- === Git 导航 ===
                            ["]g"] = "next_git",       -- 下一个 Git 变更
                            ["[g"] = "prev_git",       -- 上一个 Git 变更
                            
                            -- === 预览 ===
                            ["<Tab>"] = "preview",     -- 预览文件
                        },
					},
				},
			},
		}
	},
    animate = {
        enabled = true,
        duration = 20, -- ms per step
        easing = 'linear',
        fps = 60,
    },
    bigfile = {
        enabled = true,
        notify = false,
        size = 100 * 1024, -- 100 KB
    },
    bufdelete = { enabled = true },
    dashboard = {
        enabled = true,
        sections = {
            { section = 'header' },
            {
                icon = icons.ui.Keyboard,
                title = 'Keymaps',
                section = 'keys',
                indent = 2,
                padding = 1,
            },
            {
                icon = icons.documents.File,
                title = 'Recent Files',
                section = 'recent_files',
                indent = 2,
                padding = 1,
            },
            {
                icon = icons.documents.OpenFolder,
                title = 'Projects',
                section = 'projects',
                indent = 2,
                padding = 1,
            },
            { section = 'startup' },
        },
    },
    debug = { enabled = true },
    dim = {
        enabled = true,
        scope = {
            min_size = 5,
            max_size = 20,
            siblings = true,
        },
    },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    indent = {
        enabled = true,
        priority = 1,
        char = icons.ui.SeparatorLight,
        only_scope = false,
        only_current = false,
        hl = {
            'SnacksIndent1',
            'SnacksIndent2',
            'SnacksIndent3',
            'SnacksIndent4',
            'SnacksIndent5',
            'SnacksIndent6',
            'SnacksIndent7',
            'SnacksIndent8',
        },
    },
    input = {
        enabled = true,
        icon = icons.ui.Edit,
        icon_hl = 'SnacksInputIcon',
        icon_pos = 'left',
        prompt_pos = 'title',
        win = { style = 'input' },
        expand = true,
    },
    lazygit = { enabled = true },
    notify = { enabled = false },
    profiler = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scope = {
        enabled = false,
        keys = {
            textobject = {
                rr = {
                    min_size = 2, -- minimum size of the scope
                    edge = false, -- inner scope
                    cursor = false,
                    treesitter = { blocks = { enabled = false } },
                    desc = 'inner scope',
                },
                ai = {
                    cursor = false,
                    min_size = 2, -- minimum size of the scope
                    treesitter = { blocks = { enabled = false } },
                    desc = 'full scope',
                },
            },
            jump = {
                ['[a'] = {
                    min_size = 1, -- allow single line scopes
                    bottom = false,
                    cursor = false,
                    edge = true,
                    treesitter = { blocks = { enabled = false } },
                    desc = 'jump to top edge of scope',
                },
                [']a'] = {
                    min_size = 1, -- allow single line scopes
                    bottom = true,
                    cursor = false,
                    edge = true,
                    treesitter = { blocks = { enabled = false } },
                    desc = 'jump to bottom edge of scope',
                },
            },
        },
    },
    scratch = {
        enabled = true,
        name = 'SCRATCH',
        ft = function()
            if vim.bo.buftype == '' and vim.bo.filetype ~= '' then
                return vim.bo.filetype
            end
            return 'markdown'
        end,
        icon = nil,
        root = vim.fn.stdpath('data') .. '/scratch',
        autowrite = true,
        filekey = {
            cwd = true,
            branch = true,
            count = true,
        },
        win = {
            width = 120,
            height = 40,
            bo = { buftype = '', buflisted = false, bufhidden = 'hide', swapfile = false },
            minimal = false,
            noautocmd = false,
            zindex = 20,
            wo = { winhighlight = 'NormalFloat:Normal' },
            border = 'rounded',
            title_pos = 'center',
            footer_pos = 'center',

            keys = {
                ['execute'] = {
                    '<cr>',
                    function(_)
                        vim.cmd('%SnipRun')
                    end,
                    desc = 'Execute buffer',
                    mode = { 'n', 'x' },
                },
            },
        },
        win_by_ft = {
            lua = {
                keys = {
                    ['source'] = {
                        '<cr>',
                        function(self)
                            local name = 'scratch.' .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ':e')
                            Snacks.debug.run({ buf = self.buf, name = name })
                        end,
                        desc = 'Source buffer',
                        mode = { 'n', 'x' },
                    },
                    ['execute'] = {
                        'e',
                        function(_)
                            vim.cmd('%SnipRun')
                        end,
                        desc = 'Execute buffer',
                        mode = { 'n', 'x' },
                    },
                },
            },
        },
    },
    scroll = { enabled = false },
    statuscolumn = {
        enabled = true,
        left = { 'mark', 'sign' },
        right = { 'fold', 'git' },
        folds = {
            open = false,
            git_hl = false,
        },
        git = {
            patterns = { 'GitSign', 'MiniDiffSign' },
        },
        refresh = 50,
    },
    terminal = { enabled = false },
    toggle = { enabled = false },
    win = { enabled = true },
    words = { enabled = false },
    zen = {
        enabled = true,
        toggles = {
            dim = true,
            git_signs = false,
            mini_diff_signs = false,
            -- diagnostics = false,
            -- inlay_hints = false,
        },
        show = {
            statusline = false,
            tabline = false,
        },
        win = { style = 'zen' },
        zoom = {
            toggles = {},
            show = { statusline = true, tabline = true },
            win = {
                backdrop = false,
                width = 0,
            },
        },
    },
    explorer = { 
		enabled = true,
		replace_netrw = true,
		-- ===== 外观配置 =====
	    width = 35,                    -- 侧边栏宽度
		position = "left",             -- left/right/float
		icons = {
			folder_closed = "",
			folder_open = "",
			file = "",
			symlink = "",
			modified = "●",
			hidden = "󰘓",
		},
    
		-- ===== 行为配置 =====
		follow_file = true,            -- 自动跟随当前文件
		auto_close = false,            -- 打开文件后不自动关闭
		show_hidden = false,           -- 默认隐藏 dotfiles
    
		-- ===== Git 集成 =====
		git = {
			enabled = true,
			show_ignored = true,      -- 不显示 .gitignore 的文件
		},
    
	    -- ===== 过滤器 =====
		filters = {
			custom = { 
				"^%.git$",             -- 隐藏 .git 目录
				"node_modules",        -- 隐藏 node_modules
				"%.pyc$",              -- 隐藏 Python 缓存
				"%.class$",            -- 隐藏 Java 编译文件
				"__pycache__",
			},
		},
    
		-- ===== 文件操作 =====
		actions = {
			open_file = {
				quit_on_open = false,  -- 打开文件后不关闭 explorer
				window_picker = {
					enable = true,      -- 启用窗口选择器
				},
			},
		},
	},
    image = { enabled = true },
})
