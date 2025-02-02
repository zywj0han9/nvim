return {
        'saghen/blink.cmp',
        dependencies = {
            "moyiz/blink-emoji.nvim",

        },
        version = '*',
        config = function()
                 require('plugins.config.blink')
                 end,
        opts_extend = { 'sources.default' },
        event = { 'InsertEnter' },

}
