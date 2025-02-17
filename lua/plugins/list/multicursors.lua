return {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
        'anuvyklack/hydra.nvim',
    },
    opts = {},
    config = function()
                 require('plugins.config.multicursors')
    end,
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
}
