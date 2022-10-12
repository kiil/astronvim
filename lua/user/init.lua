local config = {
    header = {
        "    Kiils ",
    },

    -- Configure AstroNvim updates
    updater = {
        remote = "origin", -- remote to use
        channel = "nightly", -- "stable" or "nightly"
        version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "main", -- branch name (NIGHTLY ONLY)
        commit = nil, -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false, -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        -- remotes = { -- easily add new remotes to track
        --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
        --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
        --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        -- },
    },

    -- Set colorscheme
    -- colorscheme = "default_theme",
    colorscheme = "catppuccin",


    -- set vim options here (vim.<first_key>.<second_key> =  value)
    options = {
        opt_global = {
            foldmethod = 'expr',
            foldexpr = 'nvim_treesitter#foldexpr()',
        },
        opt = {
            foldmethod = 'expr',
            foldexpr = 'nvim_treesitter#foldexpr()',
            relativenumber = true, -- sets vim.opt.relativenumber
            -- wrap = true,
            -- linebreak = true
        },
        g = {
            mapleader = " ", -- sets vim.g.mapleader
            maplocalleader = ',',
            catppuccin_flavour = "mocha",
            -- vimwiki_list = {
            --   {
            --     path = '~/GD/TEKST/vimwiki/selvet/',
            --     ext = '.txt',
            --     syntax = 'markdown',
            --     links_space_char = '_'
            --   },
            --   {
            --     path = '~/GD/TEKST/vimwiki/familie/',
            --     ext = '.txt',
            --     syntax = 'markdown',
            --     links_space_char =  '_'
            --   },
            --   {
            --     path = '~/GD/TEKST/vimwiki/forretning/',
            --     ext = '.txt',
            --     syntax = 'markdown',
            --     links_space_char = '_'
            --   },
            --   {
            --     path = '~/GD/TEKST/vimwiki/skrivning/',
            --     ext = '.txt',
            --     syntax = 'markdown',
            --     links_space_char = '_'
            --   },
            --   {
            --     path = '~/GD/TEKST/vimwiki/folkets/',
            --     ext = '.txt',
            --     syntax = 'markdown',
            --     links_space_char = '_'
            --   },
            --   {
            --     path = '~/GD/TEKST/vimwiki/indhold/',
            --     ext = '.txt',
            --     syntax = 'markdown',
            --     links_space_char = '_'
            --   },
            --   {
            --     path = '~/GD/TEKST/vimwiki/klimaleksikon/',
            --     ext = '.txt',
            --     syntax = 'markdown',
            --     links_space_char = '_'
            --   },
            --   {
            --     path = '~/GD/TEKST/vimwiki/biografi/',
            --     ext = '.txt',
            --     syntax = 'markdown',
            --     links_space_char = '_'
            --   },
            --   {
            --     path = '~/GD/TEKST/vimwiki/camilla/',
            --     ext = '.txt',
            --     syntax = 'markdown',
            --     links_space_char = '_'
            --   }
            -- },
            -- vimwiki_global_ext = 0,
            -- markdown_folding = 1,
        },
    },

    -- Default theme configuration
    default_theme = {
        diagnostics_style = { italic = true },
        -- Modify the color table
        colors = {
            fg = "#abb2bf",
        },
        -- Modify the highlight groups
        highlights = function(highlights)
            local C = require "default_theme.colors"

            highlights.Normal = { fg = C.fg, bg = C.bg }
            return highlights
        end,
        plugins = { -- enable or disable extra plugin highlighting
            aerial = true,
            beacon = false,
            bufferline = true,
            dashboard = true,
            highlighturl = true,
            hop = false,
            indent_blankline = true,
            lightspeed = false,
            ["neo-tree"] = true,
            notify = true,
            ["nvim-tree"] = false,
            ["nvim-web-devicons"] = true,
            rainbow = true,
            symbols_outline = false,
            telescope = true,
            vimwiki = false,
            ["which-key"] = true,
        },
    },

    -- Disable AstroNvim ui features
    ui = {
        nui_input = true,
        telescope_select = true,
    },

    -- Mapping data with "desc" stored directly by vim.keymap.set().
    --
    -- Please use this mappings table to set keyboard mapping since this is the
    -- lower level configuration and more robust one. (which-key will
    -- automatically pick-up stored data by this setting.)
    mappings = {
        -- first key is the mode
        n = {
            -- second key is the lefthand side of the map
            -- mappings seen under group name "Buffer"
            ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
            ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
            ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
            ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
            ["<leader>rl"] = { "<Plug>RDSendLine", desc = "Line to R" },
            -- quick save
            -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        },
        v = {
            ["<leader>rs"] = { "<Plug>RDSendSelection", desc = "Selection to R" },
        },
        t = {
            -- setting a mapping to false will disable it
            -- ["<esc>"] = false,
        },
    },

    -- Configure plugins
    plugins = {
        -- Add plugins, the packer syntax without the "use"
        init = {
            -- You can disable default plugins as follows:
            -- ["goolord/alpha-nvim"] = { disable = true },

            -- You can also add new plugins here as well:
            -- { "andweeb/presence.nvim" },
            -- {
            --   "ray-x/lsp_signature.nvim",
            --   event = "BufRead",
            --   config = function()
            --     require("lsp_signature").setup()
            --   end,
            -- },
        },
        -- All other entries override the setup() call for default plugins
        ["null-ls"] = function(config)
            local null_ls = require "null-ls"
            -- Check supported formatters and linters
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
            config.sources = {
                -- Set a formatter
                null_ls.builtins.formatting.rufo,
                -- Set a linter
                null_ls.builtins.diagnostics.rubocop,
            }
            -- set up null-ls's on_attach function
            config.on_attach = function(client)
                -- NOTE: You can remove this on attach function to disable format on save
                if client.resolved_capabilities.document_formatting then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        desc = "Auto format before save",
                        pattern = "<buffer>",
                        callback = vim.lsp.buf.formatting_sync,
                    })
                end
            end
            return config -- return final config table
        end,
        treesitter = {
            ensure_installed = { "lua" },
        },
        better_escape = {
            mapping = { "jj" },
        },
        cmp = {
            sources = {
                {
                    name = 'buffer',
                    -- Correct:
                    option = {
                        keyword_pattern = [[\k\+]],
                        get_bufnrs = function()
                            return vim.api.nvim_list_bufs()
                        end
                    }
                },
            },
        },
        ["nvim-lsp-installer"] = {
            ensure_installed = { "sumneko_lua" },
        },
        packer = {
            compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
        },
    },

    -- LuaSnip Options
    luasnip = {
        -- Add paths for including more VS Code style snippets in luasnip
        vscode_snippet_paths = {},
        -- Extend filetypes
        filetype_extend = {
            javascript = { "javascriptreact" },
        },
    },

    -- Modify which-key registration
    ["which-key"] = {
        -- Add bindings
        register = {
            -- first key is the mode, n == normal mode
            n = {
                -- second key is the prefix, <leader> prefixes
                ["<leader>"] = {
                    -- which-key registration table for normal mode, leader prefix
                    ["b"] = { name = "Buffer" },
                    ["r"] = { name = "R" },
                    ["fR"] = { "<cmd>Telescope bibtex<cr>", "Find reference in bibtex files" },
                    ["P"] = { ":!pandoc % -t plain<cr>", "Pandoc" },
                    ["sC"] = { "<cmd>Telescope neoclip<cr>", "Search clipboard" },
                    ["sM"] = { "<cmd>lua require('telescope').extensions.macroscope.default()<cr>", "Search macros" },
                    ["v"] = { "`[v`]", "Visual select last change" },
                },
                ["g."] = { "`[v`]", "Visual select last change" },
            },
            v = {
                ["<leader>"] = {
                    ["r"] = { name = "R" },
                    ["a"] = { ":s/\\n/\\r\\r<cr>", "add linebreaks" },
                    ["b"] = { ":s/^/> /<cr>", "blockquote" },
                },
            },
        },
    },

    -- CMP Source Priorities
    -- modify here the priorities of default cmp sources
    -- higher value == higher priority
    -- The value can also be set to a boolean for disabling default sources:
    -- false == disabled
    -- true == 1000
    cmp = {
        source_priority = {
            buffer = 1000,
            luasnip = 350,
            nvim_lsp = 300,
            path = 250,
        },
        sources = {
            {
                name = 'buffer',
                -- Correct:
                option = {
                    keyword_pattern = [[\k\+]],
                }
            },
        },
    },

    -- Extend LSP configuration
    lsp = {
        -- enable servers that you already have installed without lsp-installer
        servers = {
            -- "pyright"
        },
        -- add to the server on_attach function
        -- on_attach = function(client, bufnr)
        -- end,

        -- override the lsp installer server-registration function
        -- server_registration = function(server, opts)
        --   require("lspconfig")[server].setup(opts)
        -- end,

        -- Add overrides for LSP server settings, the keys are the name of the server
        ["server-settings"] = {
            -- example for addings schemas to yamlls
            -- yamlls = {
            --   settings = {
            --     yaml = {
            --       schemas = {
            --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
            --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
            --       },
            --     },
            --   },
            -- },
        },
    },

    -- Diagnostics configuration (for vim.diagnostics.config({}))
    diagnostics = {
        virtual_text = true,
        underline = true,
    },

    -- This function is run last
    -- good place to configure mappings and vim options
    polish = function()
        -- Set key bindings
        vim.keymap.set("n", "<C-s>", ":w!<CR>")

        -- Set autocommands
        vim.api.nvim_create_augroup("packer_conf", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePost", {
            desc = "Sync packer after modifying plugins.lua",
            group = "packer_conf",
            pattern = "plugins.lua",
            command = "source <afile> | PackerSync",
        })
        vim.api.nvim_create_augroup("tekst", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            desc = "spelling",
            group = "tekst",
            pattern = { "markdown", "text" },
            command = "setlocal wrap | setlocal linebreak | setlocal spell spelllang=da,en | nmap æ [s| nmap ø ]s| nmap å z=| inoremap <buffer> , ,<C-G>u| nmap M yswml",
        })

        -- Set up custom filetypes
        -- vim.filetype.add {
        --   extension = {
        --     foo = "fooscript",
        --   },
        --   filename = {
        --     ["Foofile"] = "fooscript",
        --   },
        --   pattern = {
        --     ["~/%.config/foo/.*"] = "fooscript",
        --   },
        -- }
    end,
}

-- load after
-- This will load bibtex and have it override the default file sorter
require('telescope').load_extension('bibtex')
require('telescope').load_extension('neoclip')
require('neoclip').setup()
require('leap').set_default_keymaps()
require('leap').setup {
    case_sensitive = true,
}
require("nvim-surround").setup({
    surrounds = {
        ["*"] = {
            add = function()
                return { { "*" }, { "*" } }
            end,
        },
    },
    aliases = {
        ["m"] = "*",
    },
})



return config
