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

    use({
        "ibhagwan/fzf-lua",
        config = require("fzf-lua").setup({"fzf-native"}),
        requires = { "kyazdani42/nvim-web-devicons" },
    })
    

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }


    -- Visuals
    use({
        "nvim-lualine/lualine.nvim",
        config = function() require("lualine").setup() end,
    })

    use({
        "folke/zen-mode.nvim",
        config = function() require("zen-mode").setup {
            kitty = {
              enabled = true,
              font = "+4", -- font size increment
            },
        } end
    })

    -- Easier reading
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("indent_blankline").setup {
            vim.cmd [[highlight IndentBlanklineChar guifg=#E5C07B gui=nocombine]]
        } end
    })

    -- Completing a few things
    use "mattn/emmet-vim"
end)
