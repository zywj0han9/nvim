return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- 可选，用于图标显示
  	config = function()
    	require("lualine").setup {
      	options = {
        	theme = 'auto', -- 自动主题
        	section_separators = {'', ''},
        	component_separators = {'', ''},
        	icons_enabled = true,
      	},
      	sections = {
        	lualine_a = {'mode'},
        	lualine_b = {'branch', 'diff', 'diagnostics'},
        	lualine_c = {'filename'},
        	lualine_x = {'encoding', 'fileformat', 'filetype'},
        	lualine_y = {'progress'},
        	lualine_z = {'location'}
      	},
      	inactive_sections = {
        	lualine_a = {},
        	lualine_b = {},
        	lualine_c = {'filename'},
        	lualine_x = {'location'},
        	lualine_y = {},
        	lualine_z = {}
      	},
      	tabline = {},
      	extensions = {}
    	}
  	end
}
