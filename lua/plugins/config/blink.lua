local blink = require('blink.cmp')
local icons = require('lib.icons')

blink.setup({
    -- 'default', 'super-tab', 'enter'
    keymap = {
        preset = 'cmdline',
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    -- 'preselect', 'manual', 'auto_insert'
    completion = {
        list = {
                selection = { auto_insert = true },
        },
        menu = { border = 'rounded' },
        documentation = { window = { border = 'rounded' } },
		kind_icon = {
			text = function(ctx)
				-- default kind icon
				local icon = ctx.kind_icon
				-- if LSP source, check for color derived from documentation
				if ctx.item.source_name == "LSP" then
					local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
					if color_item and color_item.abbr ~= "" then
						icon = color_item.abbr
					end
				end
				return icon .. ctx.icon_gap
			end,
			highlight = function(ctx)
			-- default highlight group
			local highlight = "BlinkCmpKind" .. ctx.kind
			-- if LSP source, check for color derived from documentation
			if ctx.item.source_name == "LSP" then
				local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
				if color_item and color_item.abbr_hl_group then
				    highlight = color_item.abbr_hl_group
				end
			end
			return highlight
		end,
		},
    },
    cmdline = {
        enable = true,
        keymap = { preset = 'inherit' },
        completion = {
            ghosttext = {
                enable = true,
                -- Set to 'none' to disable ghost text
                format = 'blink',
            },
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
        kind_icons = icons.kind,
    },
    sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
            lazydev = {
                name = 'LazyDev',
                module = 'lazydev.integrations.blink',
                -- make lazydev completions top priority (see `:h blink.cmp`)
                score_offset = 100,
            },
        },
    },
})
