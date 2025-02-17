return {
    'nvimtools/none-ls.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'jay-babu/mason-null-ls.nvim'
    },
    config = function()
        require('plugins.config.null-ls')
    end,
    event = { 'BufReadPost', 'BufNewFile' },
}
