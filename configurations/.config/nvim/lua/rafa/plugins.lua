vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- The theme (configured on after/plugin/colour.lua)
    use "gruvbox-community/gruvbox"

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
        config = require("rafa.plugin.fzf").configure,
        requires = { "kyazdani42/nvim-web-devicons" },
    })
    

    -- LSP completion
    use({
        "hrsh7th/nvim-cmp",
        config = require("rafa.plugin.cmp").configure,
        requires = {
            -- LSP snip
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        }
    })
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = require("rafa.plugin.lsp").configure,
        requires = {
            "hrsh7th/cmp-nvim-lsp"
        }
    })

    -- Help with LSP diagnostics, code actions
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = require("rafa.plugin.null_ls").configure,
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- Languages syntax highlight
    use "fatih/vim-go"
    use "LnL7/vim-nix"

    -- Visuals
    use({
        "nvim-lualine/lualine.nvim",
        config = function() require("lualine").setup() end,
    })

    use({
        "folke/zen-mode.nvim",
        config = function() require("zen-mode").setup() end
    })

    -- Easier reading
    use "Yggdroot/indentLine"

    -- Completing a few things
    use "mattn/emmet-vim"
end)
