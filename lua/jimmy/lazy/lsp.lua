return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                'lua_ls',
                'rust_analyzer', 'azure_pipelines_ls',
                'terraformls', 'bicep',
                'ansiblels', 'dockerls',
                'docker_compose_language_service', 'gopls',
                'clangd', 'pylsp'
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
                ['pyslp'] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.pylsp.setup {
                        settings = {
                            pylsp = {
                            plugins = {
                                flake8 = {
                                    enabled = true,
                                    maxLineLength = 119,
                                },
                                mypy = { enabled = true },
                                pycodestyle = { enable = false },
                                pyflakes = { enabled = false },
                                black = { enable = true, line_length = 119},
                                autopep8 = { enabled = false },
                                jedi_completion = { fuzzy = true },
                                isort = { enabled = false },
                                }
                            }
                        }
                    }
                end,
                ['azure_pipelines_ls'] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.azure_pipelines_ls.setup {
                        settings = {
                            yaml = {
                                schemas = {
                                    ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                                        "/azure-pipeline*.y*l",
                                        "/*.azure*",
                                        "Azure-Pipelines/**/*.y*l",
                                        "Pipelines/*.y*l",
                                    },
                                },
                            },
                        }
                    }
                end,
                ['clangd'] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.clangd.setup {}
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
