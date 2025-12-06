return {
    enable = true,
    "zbirenbaum/copilot.lua",
    dependencies = {},
    event = "InsertEnter",  -- 插入模式下加载
    config = function()
            require('plugins.config.copilot')
    end,
}

