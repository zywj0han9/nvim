local blink = require('blink.cmp')
local icons = require('lib.icons')

blink.setup({
    -- 'default', 'super-tab', 'enter'
    keymap = {
        preset = 'cmdline',
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
		['<CR>'] = { 'accept', 'fallback' },  -- 添加这一行
		['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
		['<C-y>'] = { 'select_and_accept' },  -- Ctrl-y 直接选中并接受
    },
    -- 'preselect', 'manual', 'auto_insert'
    completion = {
        list = {
                selection = { auto_insert = true },
        },
        menu = { border = 'rounded' },
        documentation = { window = { border = 'rounded' } },
    },
    cmdline = {
        keymap = { preset = 'inherit' },
        completion = {
            menu = {
                auto_show = function(ctx)
                    return vim.fn.getcmdtype() == ':'
                    -- enable for inputs as well, with:
                    -- or vim.fn.getcmdtype() == '@'
                end,
            },
        },
    },
    signature = { window = { border = 'rounded' } },
    appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        nerd_font_variant = 'normal',
        -- kind_icons = icons.kind,
    },
    sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
        providers = {
            lazydev = {
                name = 'LazyDev',
                module = 'lazydev.integrations.blink',
                -- make lazydev completions top priority (see `:h blink.cmp`)
                score_offset = 100,
            },
			copilot = {
                name = 'copilot',
                module = 'blink-cmp-copilot',
                score_offset = 100,  -- 高优先级
                async = true,
            },
        },
    },
})
