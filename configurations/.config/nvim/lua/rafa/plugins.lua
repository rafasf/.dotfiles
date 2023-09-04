vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Looks
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Parsing
    use {
        "nvim-treesitter/nvim-treesitter",
        config = require("rafa.plugin.treesitter").configure,
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    }

    -- File navigation
    use({
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup()
        end
    })

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'jose-elias-alvarez/null-ls.nvim' },
            { 'jay-babu/mason-null-ls.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = true,
                    auto_refresh = true,
                    layout = {
                        position = "right"
                    }
                }
            })
        end,
    }

    -- Visuals
    use({
        "nvim-lualine/lualine.nvim",
        config = function() require("lualine").setup() end,
    })

    -- Easier reading
    use({
        "lukas-reineke/indent-blankline.nvim",
    })

    -- Syntax
    use "wuelnerdotexe/vim-astro"

    -- Finding things
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
        },
        config = function()
            require("telescope").setup {
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        previewer = false
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                    }
                }
            }
        end
    }
end)
