local blink = require('blink.cmp')
local icons = require('lib.icons')

blink.setup({
    -- 'default', 'super-tab', 'enter'
    keymap = {
        preset = 'super-tab',
        ['<E>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<I>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    -- 'preselect', 'manual', 'auto_insert'
    completion = {
        list = { selection = { auto_insert = true } },
        menu = { border = 'rounded' },
        documentation = { window = { border = 'rounded' } },
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
        default = { 'lsp', 'path', 'snippets', 'buffer',  'dadbod', 'emoji' },
        providers = {
            lsp = 
            {
                name = 'lsp',
                enabled = true,
                module = 'blink.cmp.sources.lsp',
                -- kind = 'LSP',
                score_offset = 90,
            },
            path = 
            {
                name = 'Path',
                module = "blink.cmp.sources.path",
                score_offset = 25,
                fallbacks = { "snippets", "buffer" },
                opts = {
                    trailing_slash = false,
                    label_trailing_slash = true,
                    get_cwd = function(context)
                        return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
                    end,
                    show_hidden_files_by_default = true,
                },
            },
            buffer = 
            {
                name = "Buffer",
                enabled = true,
                max_items = 3,
                module = "blink.cmp.sources.buffer",
                min_keyword_length = 4,
                score_offset = 15, -- the higher the number, the higher the priority
            },
            snippets = 
            {
                name = "snippets",
                enabled = true,
                max_items = 8,
                min_keyword_length = 2,
                module = "blink.cmp.sources.snippets",
                score_offset = 85, -- the higher the number, the higher the priority
                -- Only show snippets if I type the trigger_text characters, so
                -- to expand the "bash" snippet, if the trigger_text is ";" I have to
                should_show_items = function()
                local col = vim.api.nvim_win_get_cursor(0)[2]
                local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
                -- NOTE: remember that `trigger_text` is modified at the top of the file
                    return before_cursor:match(trigger_text .. "%w*$") ~= nil
                end,
                -- After accepting the completion, delete the trigger_text characters
                -- from the final inserted text
                transform_items = function(_, items)
                local col = vim.api.nvim_win_get_cursor(0)[2]
                local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
                local trigger_pos = before_cursor:find(trigger_text .. "[^" .. trigger_text .. "]*$")
                if trigger_pos then
                for _, item in ipairs(items) do
                    item.textEdit = {
                        newText = item.insertText or item.label,
                        range = {
                        start = { line = vim.fn.line(".") - 1, character = trigger_pos - 1 },
                        ["end"] = { line = vim.fn.line(".") - 1, character = col },
                        },
                    }
                    end
                end
                vim.schedule(function()
                    require("blink.cmp").reload("snippets")
                end)
                    return items
                end,
            },
            dadbod = 
            {
                name = "Dadbod",
                module = "vim_dadbod_completion.blink",
                score_offset = 85, -- the higher the number, the higher the priority
            },
            -- https://github.com/moyiz/blink-emoji.nvim
            emoji = 
            {
                module = "blink-emoji",
                name = "Emoji",
                score_offset = 15, -- the higher the number, the higher the priority
                opts = { insert = true }, -- Insert emoji (default) or complete its name
            },
            -- https://github.com/Kaiser-Yang/blink-cmp-dictionary
            -- In macOS to get started with a dictionary:
            -- cp /usr/share/dict/words ~/github/dotfiles-latest/dictionaries/words.txt
            --
            -- NOTE: For the word definitions make sure "wn" is installed
            -- brew install wordnet
            --dictionary = 
            --{
                --module = "blink-cmp-dictionary",
                --name = "Dict",
                --score_offset = 20, -- the higher the number, the higher the priority
                -- https://github.com/Kaiser-Yang/blink-cmp-dictionary/issues/2
                --enabled = false,
                --max_items = 8,
                --min_keyword_length = 3,
                --opts = {
                -- -- The dictionary by default now uses fzf, make sure to have it
                -- -- installed
                -- -- https://github.com/Kaiser-Yang/blink-cmp-dictionary/issues/2
                --
                -- Do not specify a file, just the path, and in the path you need to
                -- have your .txt files
                -- dictionary_directories = { vim.fn.expand("~/github/dotfiles-latest/dictionaries") },
                -- --  NOTE: To disable the definitions uncomment this section below
                -- separate_output = function(output)
                --   local items = {}
                --   for line in output:gmatch("[^\r\n]+") do
                --     table.insert(items, {
                --       label = line,
                --       insert_text = line,
                --       documentation = nil,
                --     })
                --   end
                --   return items
                -- end,
                --},
            --},
        },
    },
})

