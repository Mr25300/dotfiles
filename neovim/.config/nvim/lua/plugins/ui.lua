return {
    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                transparent_background = true
            })

            vim.cmd.colorscheme "catppuccin-mocha"
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {}
    }
    -- {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-tree/nvim-web-devicons",
    --         "MunifTanjim/nui.nvim"
    --     },
    --     keys = {
    --         { "<leader>n", "<cmd>Neotree toggle<CR>", desc = "Toggle Explorer" }
    --     }
    -- }
}
