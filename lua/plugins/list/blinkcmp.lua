return {
        'saghen/blink.cmp',
        dependencies = {
            'moyiz/blink-emoji.nvim',
            'rafamadriz/friendly-snippets',
            'dmitmel/cmp-digraphs',
			'giuxtaposition/blink-cmp-copilot',
        },
        version = '*',
        config = function()
                 require('plugins.config.blink')
                 end,
        opts_extend = { 'sources.default' },
        event = { 'InsertEnter' },
}
