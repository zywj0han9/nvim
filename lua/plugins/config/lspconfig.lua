local lspconfig = require('lspconfig')
local icons = require('lib.icons')

local auto_install = require('lib.util').get_user_config('auto_install', true)
local installed_servers = {}
if auto_install then
    installed_servers = {
        'pyright',
        'gopls',
        'clangd',
        'lua_ls',
        'bashls',
        'jsonls',
        'vimls',
        'typos_lsp',
        'vimls',
        'dockerls',
        'sqls',
        'cssls',
        'html',
        'markdown_oxide',
    }
end

local default_setup = function(server)
    lspconfig[server].setup({
        capabilities =
            require('blink.cmp').get_lsp_capabilities()
    })
end

local signs = { Error = icons.Error, Warn = icons.Warning, Hint = icons.Hint, Info = icons.Information }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

require('mason-lspconfig').setup({
    ensure_installed = installed_servers,
    handlers = {
        default_setup,
        lua_ls = function()
            lspconfig.lua_ls.setup({
                capabilities = require('blink.cmp').get_lsp_capabilities(),
                settings = {
                    Lua = {
                        runtime = {
							version = 'LuaJIT',
                            path = vim.split(package.path, ';'),  -- 添加这行
						},
                        diagnostics = {
							globals = { 'vim' },
							disable = {
								'missing-fields',           -- 缺少字段（TreeSitter 配置常见）
								'incomplete-signature-doc', -- 签名文档不完整
								'undefined-field',          -- 未定义字段（插件动态字段）
                            },
						},
                        workspace = {
							library = {
								vim.env.VIMRUNTIME,
								vim.fn.stdpath('config'),
								vim.fn.stdpath('data') .. '/lazy/lazy.nvim',
                                '${3rd}/luv/library',
							},
                            checkThirdParty = false,
						},
						telemetry = { enable = false },
                        format = {
                            enable = true,
                            defaultConfig = {
                                align_continuous_assign_statement = false,
                                align_continuous_rect_table_field = false,
                                align_array_table = false,
                            },
                        },
                    },
                },
            })
        end,
    },
})

