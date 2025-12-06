return {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
		require('plugins.config.nvim-spectre')
	end,
    cmd = 'Spectre',
}

