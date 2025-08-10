==============================================================================
avante:                                                                     ✅

avante.nvim ~
- ✅ OK Found required plugin: MunifTanjim/nui.nvim
- ✅ OK Found required plugin: nvim-lua/plenary.nvim
- ✅ OK Found icons plugin (nvim-web-devicons or mini.icons)
- ✅ OK Using native input provider (no additional dependencies required)

TreeSitter Dependencies ~
- ✅ OK All essential TreeSitter parsers are installed
- ✅ OK TreeSitter highlighter is available

==============================================================================
blink.cmp:                                                                1 ⚠️

System ~
- ✅ OK curl is installed
- ✅ OK git is installed
- ✅ OK Your system is supported by pre-built binaries (x86_64-unknown-linux-gnu)
- ✅ OK blink_cmp_fuzzy lib is downloaded/built

Sources ~
- ⚠️ WARNING Some providers may show up as "disabled" but are enabled dynamically (i.e. cmdline)

Default sources ~
- lazydev (lazydev.integrations.blink)
- lsp (blink.cmp.sources.lsp)
- path (blink.cmp.sources.path)
- snippets (blink.cmp.sources.snippets)
- buffer (blink.cmp.sources.buffer)

Cmdline sources ~
- buffer (blink.cmp.sources.buffer)
- cmdline (blink.cmp.sources.cmdline)

Disabled sources ~
- omni (blink.cmp.sources.complete_func)

==============================================================================
copilot:                                                                  1 ⚠️

{copilot.lua} ~
- {copilot.lua} GitHub Copilot plugin for Neovim

Copilot Dependencies ~
- ✅ OK `node` found: v22.18.0

Copilot Authentication ~
- No environment token set (`GITHUB_COPILOT_TOKEN` or `GH_COPILOT_TOKEN`)
- ✅ OK Local credentials file found
- Location: `/home/J0han9/.config/github-copilot/apps.json`

Copilot LSP Status ~
- ✅ OK LSP client is available and running
- Client ID: 1
- ⚠️ WARNING LSP authentication status: not authenticated
- For detailed authentication status, run `:Copilot status`

Copilot Configuration ~
- ✅ OK Suggestions enabled
- Auto-trigger: enabled
- ✅ OK Panel enabled
- Panel Keybinding: <M-CR>
- Log file: /home/J0han9/.local/state/nvim/copilot-lua.log

==============================================================================
fzf_lua:                                                                  3 ⚠️

fzf-lua [required] ~
- ✅ OK 'fzf' `0.65.1 (e5cd7f0a)`
- ✅ OK 'git' `git version 2.50.1`
- ✅ OK 'rg' `ripgrep 14.1.1`
- ✅ OK 'fd' `fd 10.2.0`

fzf-lua [optional] ~
- ✅ OK `nvim-web-devicons` found
- ✅ OK 'rg' `ripgrep 14.1.1`
- ✅ OK 'fd' `fd 10.2.0`

fzf-lua [optional:media] ~
- ⚠️ WARNING 'viu' not found
- ⚠️ WARNING 'chafa' not found
- ⚠️ WARNING 'ueberzugpp' not found

fzf-lua [env] ~
- ✅ OK `FZF_DEFAULT_OPTS` is not set
- ✅ OK `FZF_DEFAULT_OPTS_FILE` is not set

==============================================================================
img-clip:                                                                   ✅

img-clip.nvim ~
- ✅ OK `wl-clipboard` is installed

==============================================================================
lazy:                                                                     2 ⚠️

lazy.nvim ~
- {lazy.nvim} version `11.17.1`
- ✅ OK {git} `version 2.50.1`
- ✅ OK no existing packages found by other package managers
- ✅ OK packer_compiled.lua not found

luarocks ~
- checking `luarocks` installation
- ✅ OK no plugins require `luarocks`, so you can ignore any warnings below
- ✅ OK {luarocks} `/usr/bin/luarocks 3.12.2`
- ⚠️ WARNING `lua` version `5.1` needed, but found `Lua 5.4.8  Copyright (C) 1994-2025 Lua.org, PUC-Rio`
- ⚠️ WARNING {lua5.1} or {lua} or {lua-5.1} version `5.1` not installed

==============================================================================
lspconfig:                                                                  ✅

- Skipped. This healthcheck is redundant with `:checkhealth vim.lsp`.

==============================================================================
mason:                                                                    7 ⚠️

mason.nvim ~
- ✅ OK mason.nvim version v2.0.1
- ✅ OK PATH: append
- ✅ OK Providers: 
    mason.providers.registry-api
    mason.providers.client
- ✅ OK neovim version >= 0.10.0

mason.nvim [Registries] ~
- ✅ OK Registry `github.com/mason-org/mason-registry version: 2025-08-09-holy-cherry` is installed.

mason.nvim [Core utils] ~
- ✅ OK unzip: `UnZip 6.00 of 20 April 2009, by Info-ZIP.  Maintained by C. Spieler.  Send`
- ✅ OK wget: `GNU Wget 1.25.0，非交互式的网络文件下载工具。`
- ✅ OK curl: `curl 8.12.1 (Linux) libcurl/8.12.1 OpenSSL/3.0.16 zlib/1.2.13 zstd/1.5.6 libssh2/1.11.1 nghttp2/1.57.0`
- ✅ OK gzip: `gzip 1.14-modified`
- ✅ OK tar: `tar (GNU tar) 1.35`
- ✅ OK bash: `GNU bash，版本 5.3.3(1)-release (x86_64-pc-linux-gnu)`
- ✅ OK sh: `Ok`

mason.nvim [Languages] ~
- ⚠️ WARNING Ruby: not available
  - ADVICE:
    - spawn: ruby failed with exit code - and signal -. Could not find executable "ruby" in PATH.

- ⚠️ WARNING RubyGem: not available
  - ADVICE:
    - spawn: gem failed with exit code - and signal -. Could not find executable "gem" in PATH.

- ⚠️ WARNING Composer: not available
  - ADVICE:
    - spawn: composer failed with exit code - and signal -. Could not find executable "composer" in PATH.

- ⚠️ WARNING PHP: not available
  - ADVICE:
    - spawn: php failed with exit code - and signal -. Could not find executable "php" in PATH.

- ✅ OK cargo: `cargo 1.88.0 (873a06493 2025-05-10) (Arch Linux rust 1:1.88.0-1)`
- ⚠️ WARNING javac: not available
  - ADVICE:
    - spawn: javac failed with exit code - and signal -. Could not find executable "javac" in PATH.

- ⚠️ WARNING java: not available
  - ADVICE:
    - spawn: java failed with exit code - and signal -. Could not find executable "java" in PATH.

- ⚠️ WARNING julia: not available
  - ADVICE:
    - spawn: julia failed with exit code - and signal -. Could not find executable "julia" in PATH.

- ✅ OK Go: `go version go1.24.5 linux/amd64`
- ✅ OK node: `v22.18.0`
- ✅ OK python: `Python 3.13.5`
- ✅ OK luarocks: `/usr/bin/luarocks 3.12.2`
- ✅ OK npm: `10.9.3`
- ✅ OK pip: `pip 25.1 from /home/J0han9/anaconda3/lib/python3.13/site-packages/pip (python 3.13)`
- ✅ OK python venv: `Ok`

==============================================================================
mason-lspconfig:                                                            ✅

mason-lspconfig.nvim ~
- ✅ OK Neovim v0.11
- ✅ OK mason.nvim v2

==============================================================================
noice:                                                                    2 ⚠️

noice.nvim ~
- ✅ OK *Neovim* >= 0.9.0
- ✅ OK You're using a GUI that should work ok
- ✅ OK *vim.go.lazyredraw* is not enabled
- ✅ OK `snacks.nvim` is installed
- ✅ OK `nvim-notify` is installed
- ✅ OK {TreeSitter} `vim` parser is installed
- ⚠️ WARNING {TreeSitter} `regex` parser is not installed. Highlighting of the cmdline for `regex` might be broken
- ✅ OK {TreeSitter} `lua` parser is installed
- ⚠️ WARNING {TreeSitter} `bash` parser is not installed. Highlighting of the cmdline for `bash` might be broken
- ✅ OK {TreeSitter} `markdown` parser is installed
- ✅ OK {TreeSitter} `markdown_inline` parser is installed

==============================================================================
nvim-treesitter:                                                          1 ⚠️

Installation ~
- ⚠️ WARNING `tree-sitter` executable not found (parser generator, only needed for :TSInstallFromGrammar, not required for :TSInstall)
- ✅ OK `node` found v22.18.0 (only needed for :TSInstallFromGrammar)
- ✅ OK `git` executable found.
- ✅ OK `cc` executable found. Selected from { vim.NIL, "cc", "gcc", "clang", "cl", "zig" }
  Version: cc (GCC) 15.1.1 20250729
- ✅ OK Neovim was compiled with tree-sitter runtime ABI version 15 (required >=13). Parsers must be compatible with runtime ABI.

OS Info:
{
  machine = "x86_64",
  release = "6.12.41-1-lts",
  sysname = "Linux",
  version = "#1 SMP PREEMPT_DYNAMIC Fri, 01 Aug 2025 20:42:03 +0000"
} ~

Parser/Features         H L F I J
  - c                   ✓ ✓ ✓ ✓ ✓
  - html                ✓ ✓ ✓ ✓ ✓
  - lua                 ✓ ✓ ✓ ✓ ✓
  - markdown            ✓ . ✓ ✓ ✓
  - markdown_inline     ✓ . . . ✓
  - query               ✓ ✓ ✓ ✓ ✓
  - vim                 ✓ ✓ ✓ . ✓
  - vimdoc              ✓ . . . ✓

  Legend: H[ighlight], L[ocals], F[olds], I[ndents], In[j]ections
         +) multiple parsers found, only one will be used
         x) errors found in the query, try to run :TSUpdate {lang} ~

==============================================================================
render-markdown:                                                    2 ⚠️  1 ❌

render-markdown.nvim [version] ~
- ✅ OK plugin 8.6.10
- ✅ OK neovim >= 0.11

render-markdown.nvim [configuration] ~
- ✅ OK valid

render-markdown.nvim [treesitter] ~
- ✅ OK markdown: parser installed
- ✅ OK markdown: highlights ~/.local/share/nvim/lazy/nvim-treesitter/queries/markdown/highlights.scm
- ❌ ERROR markdown: highlighter not enabled
  - ADVICE:
    - call vim.treesitter.start on markdown buffers
- ✅ OK markdown_inline: parser installed
- ✅ OK markdown_inline: highlights ~/.local/share/nvim/lazy/nvim-treesitter/queries/markdown_inline/highlights.scm
- ⚠️ WARNING latex: parser not installed
  - ADVICE:
    - disable latex support to avoid this warning
    - require('render-markdown').setup({ latex = { enabled = false } })
- ✅ OK html: parser installed

render-markdown.nvim [icons] ~
- ✅ OK using: nvim-web-devicons

render-markdown.nvim [executables] ~
- ⚠️ WARNING latex2text: not installed
  - ADVICE:
    - disable latex support to avoid this warning
    - require('render-markdown').setup({ latex = { enabled = false } })

render-markdown.nvim [conflicts] ~
- ✅ OK headlines: not installed
- ✅ OK markview: not installed
- ✅ OK obsidian: not installed

==============================================================================
snacks:                                                                  11 ⚠️

Snacks ~
- ✅ OK setup called

Snacks.bigfile ~
- ✅ OK setup {enabled}

Snacks.dashboard ~
- ✅ OK setup {enabled}
- ✅ OK setup ran
- ✅ OK dashboard opened

Snacks.explorer ~
- ⚠️ WARNING setup {disabled}

Snacks.image ~
- ⚠️ WARNING setup {disabled}
- ✅ OK 'kitty' `kitty 0.42.2 created by Kovid Goyal`
- ✅ OK 'magick' `Version: ImageMagick 7.1.2-0 Q16-HDRI x86_64 23234 https://imagemagick.org`
- ✅ OK 'convert' `WARNING: The convert command is deprecated in IMv7, use "magick" instead of "convert" or "magick convert"`
- ✅ OK `kitty` detected and supported
- ✅ OK `kitty` supports unicode placeholders
- ✅ OK Inline images are available
- ✅ OK Terminal Dimensions:
  - {size}: `3770` x `1947` pixels
  - {scale}: `3.25`
  - {cell}: `26` x `59` pixels
- ✅ OK Available Treesitter languages:
    `html`, `markdown_inline`, `markdown`
- ⚠️ WARNING Missing Treesitter languages:
    `css`, `javascript`, `latex`, `norg`, `scss`, `svelte`, `tsx`, `typst`, `vue`
- ⚠️ WARNING Image rendering in docs with missing treesitter parsers won't work
- ✅ OK 'gs' `10.05.1`
- ✅ OK PDF files are supported
- ✅ OK 'tectonic' `tectonic 0.15.0Tectonic 0.15.0`
- ⚠️ WARNING The `latex` treesitter parser is required to render LaTeX math expressions
- ✅ OK 'mmdc' `11.9.0`
- ✅ OK Mermaid diagrams are supported
- ✅ OK your terminal supports the kitty graphics protocol

Snacks.input ~
- ✅ OK setup {enabled}
- ✅ OK `vim.ui.input` is set to `Snacks.input`

Snacks.lazygit ~
- ✅ OK {lazygit} installed

Snacks.notifier ~
- ✅ OK setup {enabled}
- ✅ OK is ready

Snacks.picker ~
- ⚠️ WARNING setup {disabled}
- ⚠️ WARNING `vim.ui.select` for `Snacks.picker` is not enabled
- ⚠️ WARNING Missing Treesitter languages:
    `regex`
- ✅ OK 'git' `git version 2.50.1`
- ✅ OK 'rg' `ripgrep 14.1.1`
- ✅ OK `Snacks.picker.grep()` is available
- ✅ OK 'fd' `fd 10.2.0`
- ✅ OK `Snacks.picker.files()` is available
- ✅ OK `Snacks.picker.explorer()` is available
- ✅ OK `SQLite3` is available

Snacks.quickfile ~
- ✅ OK setup {enabled}

Snacks.scope ~
- ⚠️ WARNING setup {disabled}

Snacks.scroll ~
- ⚠️ WARNING setup {disabled}

Snacks.statuscolumn ~
- ✅ OK setup {enabled}

Snacks.terminal ~
- ✅ OK shell configured
  - `vim.o.shell`: /usr/bin/fish
  - `parsed`: { "/usr/bin/fish" }

Snacks.toggle ~
- ✅ OK {which-key} is installed

Snacks.words ~
- ⚠️ WARNING setup {disabled}

==============================================================================
telescope:                                                                  ✅

Checking for required plugins ~
- ✅ OK plenary installed.
- ✅ OK nvim-treesitter installed.

Checking external dependencies ~
- ✅ OK rg: found ripgrep 14.1.1
- ✅ OK fd: found fd 10.2.0

===== Installed extensions ===== ~

==============================================================================
vim.deprecated:                                                             ✅

- ✅ OK No deprecated functions detected

==============================================================================
vim.health:                                                                 ✅

Configuration ~
- ✅ OK no issues found

Runtime ~
- ✅ OK $VIMRUNTIME: /usr/share/nvim/runtime

Performance ~
- ✅ OK Build type: RelWithDebInfo

Remote Plugins ~
- ✅ OK Up to date

terminal ~
- key_backspace (kbs) terminfo entry: `key_backspace=\177`
- key_dc (kdch1) terminfo entry: `key_dc=\E[3~`
- $COLORTERM="truecolor"

External Tools ~
- ✅ OK ripgrep 14.1.1 (/usr/bin/rg)

==============================================================================
vim.lsp:                                                                    ✅

- LSP log level : WARN
- Log path: /home/J0han9/.local/state/nvim/lsp.log
- Log size: 1083 KB

vim.lsp: Active Clients ~
- copilot (id: 1)
  - Version: 1.352.0
  - Root directory: ~/.config/nvim
  - Command: { "node", "/home/J0han9/.local/share/nvim/lazy/copilot.lua/copilot/js/language-server.js", "--stdio" }
  - Settings: {
      telemetry = {
        telemetryLevel = "all"
      }
    }
  - Attached buffers: 

vim.lsp: Enabled Configurations ~
- bashls:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = false,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1 }
            },
            labelDetailsSupport = true,
            preselectSupport = false,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "bash-language-server", "start" }
  - filetypes: bash, sh
  - root_markers: .git
  - settings: {
      bashIde = {
        globPattern = "*@(.sh|.inc|.bash|.command)"
      }
    }

- clangd:
  - capabilities: {
      offsetEncoding = { "utf-8", "utf-16" },
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = false,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1 }
            },
            labelDetailsSupport = true,
            preselectSupport = false,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          editsNearCursor = true,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "clangd" }
  - filetypes: c, cpp, objc, objcpp, cuda
  - on_attach: <function @/home/J0han9/.local/share/nvim/lazy/nvim-lspconfig/lsp/clangd.lua:90>
  - on_init: <function @/home/J0han9/.local/share/nvim/lazy/nvim-lspconfig/lsp/clangd.lua:85>
  - root_markers: .clangd, .clang-tidy, .clang-format, compile_commands.json, compile_flags.txt, configure.ac, .git

- cssls:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = false,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1 }
            },
            labelDetailsSupport = true,
            preselectSupport = false,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "vscode-css-language-server", "--stdio" }
  - filetypes: css, scss, less
  - init_options: {
      provideFormatter = true
    }
  - root_markers: package.json, .git
  - settings: {
      css = {
        validate = true
      },
      less = {
        validate = true
      },
      scss = {
        validate = true
      }
    }

- dockerls:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = false,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1 }
            },
            labelDetailsSupport = true,
            preselectSupport = false,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "docker-langserver", "--stdio" }
  - filetypes: dockerfile
  - root_markers: Dockerfile

- gopls:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = false,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1 }
            },
            labelDetailsSupport = true,
            preselectSupport = false,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "gopls" }
  - filetypes: go, gomod, gowork, gotmpl
  - root_dir: <function @/home/J0han9/.local/share/nvim/lazy/nvim-lspconfig/lsp/gopls.lua:91>

- html:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = false,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1 }
            },
            labelDetailsSupport = true,
            preselectSupport = false,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "vscode-html-language-server", "--stdio" }
  - filetypes: html, templ
  - init_options: {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true
      },
      provideFormatter = true
    }
  - root_markers: package.json, .git
  - settings: {}

- jsonls:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = false,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1 }
            },
            labelDetailsSupport = true,
            preselectSupport = false,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "vscode-json-language-server", "--stdio" }
  - filetypes: json, jsonc
  - init_options: {
      provideFormatter = true
    }
  - root_markers: .git

- lua_ls:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = false,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1 }
            },
            labelDetailsSupport = true,
            preselectSupport = false,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "lua-language-server" }
  - filetypes: lua
  - root_markers: .luarc.json, .luarc.jsonc, .luacheckrc, .stylua.toml, stylua.toml, selene.toml, selene.yml, .git

- markdown_oxide:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = false,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1 }
            },
            labelDetailsSupport = true,
            preselectSupport = false,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "markdown-oxide" }
  - filetypes: markdown
  - on_attach: <function @/home/J0han9/.local/share/nvim/lazy/nvim-lspconfig/lsp/markdown_oxide.lua:15>
  - root_markers: .git, .obsidian, .moxide.toml

- pyright:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = false,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1 }
            },
            labelDetailsSupport = true,
            preselectSupport = false,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "pyright-langserver", "--stdio" }
  - filetypes: python
  - on_attach: <function @/home/J0han9/.local/share/nvim/lazy/nvim-lspconfig/lsp/pyright.lua:43>
  - root_markers: pyproject.toml, setup.py, setup.cfg, requirements.txt, Pipfile, pyrightconfig.json, .git
  - settings: {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true
        }
      }
    }

- sqls:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = false,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1 }
            },
            labelDetailsSupport = true,
            preselectSupport = false,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "sqls" }
  - filetypes: sql, mysql
  - root_markers: config.yml
  - settings: {}

- typos_lsp:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = false,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1 }
            },
            labelDetailsSupport = true,
            preselectSupport = false,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "typos-lsp" }
  - root_markers: typos.toml, _typos.toml, .typos.toml, pyproject.toml, Cargo.toml
  - settings: {}

- vimls:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = false,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1 }
            },
            labelDetailsSupport = true,
            preselectSupport = false,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "vim-language-server", "--stdio" }
  - filetypes: vim
  - init_options: {
      diagnostic = {
        enable = true
      },
      indexes = {
        count = 3,
        gap = 100,
        projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
        runtimepath = true
      },
      isNeovim = true,
      iskeyword = "@,48-57,_,192-255,-#",
      runtimepath = "",
      suggest = {
        fromRuntimepath = true,
        fromVimruntime = true
      },
      vimruntime = ""
    }
  - root_markers: .git


vim.lsp: File Watcher ~
- file watching "(workspace/didChangeWatchedFiles)" disabled on all clients

vim.lsp: Position Encodings ~
- No buffers contain mixed position encodings

==============================================================================
vim.provider:                                                             3 ⚠️

Clipboard (optional) ~
- ✅ OK Clipboard tool found: wl-copy

Node.js provider (optional) ~
- Node.js: v22.18.0

- Nvim node.js host: /home/J0han9/.npm-packages/lib/node_modules/neovim/bin/cli.js
- ✅ OK Latest "neovim" npm/yarn/pnpm package is installed: 5.3.0


Perl provider (optional) ~
- ⚠️ WARNING "Neovim::Ext" cpan module is not installed
  - ADVICE:
    - See :help |provider-perl| for more information.
    - You can disable this provider (and warning) by adding `let g:loaded_perl_provider = 0` to your init.vim
- ⚠️ WARNING No usable perl executable found

Python 3 provider (optional) ~
- `g:python3_host_prog` is not set. Searching for python3 in the environment.
- Executable: /home/J0han9/anaconda3/bin/python3
- Python version: 3.13.5
- pynvim version: 0.5.2
- ✅ OK Latest pynvim is installed.

Python virtualenv ~
- ✅ OK no $VIRTUAL_ENV

Ruby provider (optional) ~
- ⚠️ WARNING `ruby` and `gem` must be in $PATH.
  - ADVICE:
    - Install Ruby and verify that `ruby` and `gem` commands work.

==============================================================================
vim.treesitter:                                                             ✅

Treesitter features ~
- Treesitter ABI support: min 13, max 15
- WASM parser support: false

Treesitter parsers ~
- ✅ OK Parser: c                    ABI: 15, path: /usr/share/nvim/runtime/parser/c.so
- ✅ OK Parser: html                 ABI: 14, path: /home/J0han9/.local/share/nvim/lazy/nvim-treesitter/parser/html.so
- ✅ OK Parser: lua                  ABI: 15, path: /usr/share/nvim/runtime/parser/lua.so
- ✅ OK Parser: markdown             ABI: 15, path: /usr/share/nvim/runtime/parser/markdown.so
- ✅ OK Parser: markdown_inline      ABI: 15, path: /usr/share/nvim/runtime/parser/markdown_inline.so
- ✅ OK Parser: query                ABI: 15, path: /usr/share/nvim/runtime/parser/query.so
- ✅ OK Parser: vim                  ABI: 15, path: /usr/share/nvim/runtime/parser/vim.so
- ✅ OK Parser: vimdoc               ABI: 15, path: /usr/share/nvim/runtime/parser/vimdoc.so

==============================================================================
which-key:                                                                3 ⚠️

- ✅ OK Most of these checks are for informational purposes only.
  WARNINGS should be treated as a warning, and don't necessarily indicate a problem with your config.
  Please |DON'T| report these warnings as an issue.

Checking your config ~
- ⚠️ WARNING |mini.icons| is not installed
- ✅ OK |nvim-web-devicons| is installed

Checking for issues with your mappings ~
- ✅ OK No issues reported

checking for overlapping keymaps ~
- ⚠️ WARNING In mode `n`, <g> overlaps with <gO>, <grr>, <gra>, <grn>, <gri>, <grt>, <gx>, <gc>, <gcc>, <g%>:
  - <g>: Dashboard action
  - <gO>: vim.lsp.buf.document_symbol()
  - <grr>: vim.lsp.buf.references()
  - <gra>: vim.lsp.buf.code_action()
  - <grn>: vim.lsp.buf.rename()
  - <gri>: vim.lsp.buf.implementation()
  - <grt>: vim.lsp.buf.type_definition()
  - <gx>: Opens filepath or URI under cursor with the system handler (file explorer, web browser, …)
  - <gc>: Toggle comment
  - <gcc>: Toggle comment line
  - <g%>: Cycle backwards through results
- ⚠️ WARNING In mode `n`, <gc> overlaps with <gcc>:
  - <gc>: Toggle comment
  - <gcc>: Toggle comment line
- ✅ OK Overlapping keymaps are only reported for informational purposes.
  This doesn't necessarily mean there is a problem with your config.

Checking for duplicate mappings ~
- ✅ OK No duplicate mappings found

