return {
  'romgrk/barbar.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- 可选，用于图标显示
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- 插件配置选项
    animation = true,
    auto_hide = false,
    tabpages = true,
    clickable = true,
    icons = {
      buffer_index = true,
      buffer_number = false,
      button = '',
      filetype = {
        enabled = true,
      },
      separator = { left = '▎', right = '' },
      modified = { button = '●' },
      pinned = { button = '', filename = true },
    },
    insert_at_end = false,
    insert_at_start = false,
    maximum_padding = 1,
    minimum_padding = 1,
    maximum_length = 30,
    semantic_letters = true,
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    no_name_title = nil,
  }
}

