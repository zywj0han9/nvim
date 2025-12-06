return {
    'folke/persistence.nvim',
	config = function()
		require('plugins.config.persistence')
	end,
    event = 'BufReadPre',
}

