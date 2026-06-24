return {
    -- {
    --     "stevearc/oil.nvim",
    --     dependencies = {
    --         "nvim-mini/mini.icons"
    --     },
    --     lazy = false,
    --
    --     ---@module "oil"
    --     ---@type oil.SetupOpts
    --     opts = {}
    -- },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        dependencies = {
            {
                "echasnovski/mini.icons",
                opts = {}
            }
        },
        opts = {}
    }
}
