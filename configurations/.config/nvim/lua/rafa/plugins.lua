vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- The theme (configured on after/plugin/colour.lua)
    use "ellisonleao/gruvbox.nvim"
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

    use "mfussenegger/nvim-jdtls"
    use "wuelnerdotexe/vim-astro"

    -- Visuals
    use({
        "nvim-lualine/lualine.nvim",
        config = function() require("lualine").setup() end,
    })

    use({
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                kitty = {
                    enabled = true,
                    font = "+4", -- font size increment
                },
            }
        end
    })

    -- Easier reading
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                vim.cmd [[highlight IndentBlanklineChar guifg=#E5C07B gui=nocombine]]
            }
        end
    })

    -- Completing a few things
    use "mattn/emmet-vim"

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
