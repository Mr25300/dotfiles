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
    {
        "nvim-mini/mini.surround",
        event = "VeryLazy",
        version = false,
        opts = {
            mappings = {
                add = "sa",
                delete = "sd",
                find = "sf",
                find_left = "sF",
                highlight = "sh",
                replace = "sr",
                update_n_lines = "sn"
            }
        }
    }
}
