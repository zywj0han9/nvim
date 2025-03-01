local minuet = require('minuet')

minuet.setup({
    -- Enable or disable auto-completion. Note that you still need to add
    -- Minuet to your cmp/blink sources. This option controls whether cmp/blink
    -- will attempt to invoke minuet when minuet is included in cmp/blink
    -- sources. This setting has no effect on manual completion; Minuet will
    -- always be enabled when invoked manually. You can use the command
    -- `Minuet cmp/blink toggle` to toggle this option.
    cmp = {
        enable_auto_complete = true,
    },
    blink = {
        enable_auto_complete = true,
    },
    virtualtext = {
        -- Specify the filetypes to enable automatic virtual text completion,
        -- e.g., { 'python', 'lua' }. Note that you can still invoke manual
        -- completion even if the filetype is not on your auto_trigger_ft list.
        auto_trigger_ft = {},
        -- specify file types where automatic virtual text completion should be
        -- disabled. This option is useful when auto-completion is enabled for
        -- all file types i.e., when auto_trigger_ft = { '*' }
        auto_trigger_ignore_ft = {},
        keymap = {
            accept = nil,
            accept_line = nil,
            accept_n_lines = nil,
            -- Cycle to next completion item, or manually invoke completion
            next = nil,
            -- Cycle to prev completion item, or manually invoke completion
            prev = nil,
            dismiss = nil,
        },
        -- Whether show virtual text suggestion when the completion menu
        -- (nvim-cmp or blink-cmp) is visible.
        show_on_completion_menu = false,
    },
    provider = 'codestral',
    -- the maximum total characters of the context before and after the cursor
    -- 16000 characters typically equate to approximately 4,000 tokens for
    -- LLMs.
    context_window = 16000,
    -- when the total characters exceed the context window, the ratio of
    -- context before cursor and after cursor, the larger the ratio the more
    -- context before cursor will be used. This option should be between 0 and
    -- 1, context_ratio = 0.75 means the ratio will be 3:1.
    context_ratio = 0.75,
    throttle = 1000, -- only send the request every x milliseconds, use 0 to disable throttle.
    -- debounce the request in x milliseconds, set to 0 to disable debounce
    debounce = 400,
    -- Control notification display for request status
    -- Notification options:
    -- false: Disable all notifications (use boolean false, not string "false")
    -- "debug": Display all notifications (comprehensive debugging)
    -- "verbose": Display most notifications
    -- "warn": Display warnings and errors only
    -- "error": Display errors only
    notify = 'warn',
    -- The request timeout, measured in seconds. When streaming is enabled
    -- (stream = true), setting a shorter request_timeout allows for faster
    -- retrieval of completion items, albeit potentially incomplete.
    -- Conversely, with streaming disabled (stream = false), a timeout
    -- occurring before the LLM returns results will yield no completion items.
    request_timeout = 3,
    -- If completion item has multiple lines, create another completion item
    -- only containing its first line. This option only has impact for cmp and
    -- blink. For virtualtext, no single line entry will be added.
    add_single_line_entry = true,
    -- The number of completion items encoded as part of the prompt for the
    -- chat LLM. For FIM model, this is the number of requests to send. It's
    -- important to note that when 'add_single_line_entry' is set to true, the
    -- actual number of returned items may exceed this value. Additionally, the
    -- LLM cannot guarantee the exact number of completion items specified, as
    -- this parameter serves only as a prompt guideline.
    n_completions = 3,
    -- Defines the length of non-whitespace context after the cursor used to
    -- filter completion text. Set to 0 to disable filtering.
    --
    -- Example: With after_cursor_filter_length = 3 and context:
    --
    -- "def fib(n):\n|\n\nfib(5)" (where | represents cursor position),
    --
    -- if the completion text contains "fib", then "fib" and subsequent text
    -- will be removed. This setting filters repeated text generated by the
    -- LLM. A large value (e.g., 15) is recommended to avoid false positives.
    after_cursor_filter_length = 15,
    -- proxy port to use
    proxy = nil,
    provider_options = {
        -- see the documentation in each provider in the following part.
        gemini = {
        model = 'gemini-2.0-flash',
        system = "see [Prompt] section for the default value",
        few_shots = "see [Prompt] section for the default value",
        chat_input = "See [Prompt Section for default value]",
        stream = true,
        api_key = 'AIzaSyBjowu3uIxt7VGP5tFwvidhw1C_llZpEws',
        optional = {
                generationConfig = {
                maxOutputTokens = 256,
            },
            safetySettings = {
                {
                    -- HARM_CATEGORY_HATE_SPEECH,
                    -- HARM_CATEGORY_HARASSMENT
                    -- HARM_CATEGORY_SEXUALLY_EXPLICIT
                    category = 'HARM_CATEGORY_DANGEROUS_CONTENT',
                    -- BLOCK_NONE
                    threshold = 'BLOCK_ONLY_HIGH',
                },
            },
          },
        },
    },
    -- see the documentation in the `Prompt` section
    default_template = {
        template = '...',
        prompt = '...',
        guidelines = '...',
        n_completion_template = '...',
    },
    default_fim_template = {
        prompt = '...',
        suffix = '...',
    },
    default_few_shots = { '...' },
    default_chat_input = { '...' },
    -- Config options for `Minuet change_preset` command
    presets = {}
})
