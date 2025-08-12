local nvim_tree = require('nvim-tree')
local Snacks = require('snacks')

local icons = require('lib.icons')

local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return {
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    api.config.mappings.default_on_attach(bufnr)
    -- 复制
    vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy File'))
    -- 打开文件或文件夹
    vim.keymap.set('n', 'i', api.node.open.edit, opts('Open File'))
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open File'))
    -- 剪切
    vim.keymap.set('n', 'x', api.fs.cut, opts('Cut File'))
    -- 删除
    vim.keymap.set('n', 'd', api.fs.remove, opts('Delete File'))
    -- 回收站
    vim.keymap.set('n', 'D', api.fs.trash, opts('Trash File'))
    -- 粘贴
    vim.keymap.set('n', 'p', api.fs.paste, opts('Paste File'))
    -- 关闭文件夹
    vim.keymap.set('n', 'n', api.node.navigate.parent_close, opts('Close Directory'))
    -- 重命名
    vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
    -- 刷新
    vim.keymap.set('n', 'R', api.tree.reload, opts('Reload'))
    --
    --       ↑
    --       u
    -- ← n   e   i →
    --       ↓
    --
    vim.keymap.set('n', 'E', api.node.navigate.sibling.last, opts('Last Sibling'))
    vim.keymap.set('n', 'U', api.node.navigate.sibling.first, opts('First Sibling'))
    vim.keymap.set('n', 'u', 'k', opts('Prev Sibling'))
    vim.keymap.set('n', 'e', 'j', opts('Prev Sibling'))
end

local prev = { new_name = '', old_name = '' } -- Prevents duplicate events
vim.api.nvim_create_autocmd('User', {
    pattern = 'NvimTreeSetup',
    callback = function()
        local events = require('nvim-tree.api').events
        events.subscribe(events.Event.NodeRenamed, function(data)
            if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
                data = data
                Snacks.rename.on_rename_file(data.old_name, data.new_name)
            end
        end)
    end,
})

nvim_tree.setup({
    on_attach = on_attach,
    hijack_directories = { enable = true },
    update_cwd = true,
    filters = {},
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        highlight_opened_files = 'none',
        root_folder_modifier = ':t',
        indent_markers = {
            enable = false,
            icons = { corner = icons.ui.Corner, edge = icons.ui.Edge, none = icons.ui.Edge },
        },
        icons = {
            webdev_colors = true,
            git_placement = 'before',
            padding = ' ',
            symlink_arrow = icons.ui.Arrow,
            show = { file = true, folder = true, folder_arrow = true, git = true },
            glyphs = {
                default = icons.documents.File,
                symlink = icons.documents.SymLink,
                folder = {
                    arrow_open = icons.ui.ArrowOpen,
                    arrow_closed = icons.ui.ArrowClosed,
                    default = icons.documents.Folder,
                    open = icons.documents.OpenFolder,
                    empty = icons.documents.FolderEmpty,
                    empty_open = icons.documents.OpenFolderEmpty,
                    symlink = icons.documents.SymlinkFolder,
                    symlink_open = icons.documents.SymlinkFolder,
                },
                git = {
                    unstaged = icons.git.Mod,
                    staged = icons.git.Add,
                    unmerged = icons.git.Diff,
                    renamed = icons.git.Rename,
                    untracked = icons.git.Untrack,
                    deleted = icons.git.Remove,
                    ignored = icons.git.Ignore,
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = icons.diagnostics.Hint,
            info = icons.diagnostics.Information,
            warning = icons.diagnostics.Warning,
            error = icons.diagnostics.Error,
        },
    },
    update_focused_file = { enable = true, update_cwd = true, ignore_list = {} },
    git = { enable = true, ignore = true, timeout = 500 },
    view = {
        width = 20,
        side = 'left',
        adaptive_size = true,
        number = true,
        relativenumber = true,
    },
})
