return {
    -- {
    --     "nmac427/guess-indent.nvim",
    --     event = { "BufReadPre", "BufNewFile" },
    --     opts = {}
    -- },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true
        }
        -- config = function()
        --     local nvim_autopairs = require("nvim-autopairs")
        --
        --     nvim_autopairs.setup({
        --         check_ts = true
        --     })
        -- end
    },
    -- {
    --     "nvim-mini/mini.surround",
    --     event = { "BufReadPost", "BufNewFile" },
    --     version = false,
    --     opts = {
    --         mappings = {
    --             add = "sa",
    --             delete = "sd",
    --             find = "sf", -- To the right
    --             find_left = "sF",
    --             highlight = "sh",
    --             replace = "sr"
    --         },
    --
    --         n_lines = 50
    --     }
    -- }
    {
        "kylechui/nvim-surround",
        version = "^4.0.0",
        keys = { "ys", "ds", "cs" } -- Lazy-load on these key mappings
    }
}
