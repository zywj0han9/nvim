return {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
        library = {
            { path = 'luvit-meta/library', words = { 'vim%.uv' } },
            { path = 'lazy.nvim', words = { 'lazy' } },
        },
    },
    dependencies = {
        { 'Bilal2453/luvit-meta', lazy = true },
    },
}
