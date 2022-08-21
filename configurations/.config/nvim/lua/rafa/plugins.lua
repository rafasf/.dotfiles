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
    
    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = require("rafa.plugin.lsp").configure,
        requires = {
            -- LSP completion
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/nvim-cmp",
        },
    })

    -- LSP snip
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"

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

    -- Easier reading
    use "Yggdroot/indentLine"

    -- Completing a few things
    use "mattn/emmet-vim"
end)
