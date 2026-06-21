return {
    {
        "brianhuster/live-preview.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim"
        },
        ft = { "markdown", "html", "css", "javascript", "asciidoc", "svg" } -- TODO: Test each
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-mini/mini.icons"
        },
        ft = { "markdown", "quarto" },

        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = { -- TODO: Go through all options
            latex = { enabled = false },
            completions = {
                lsp = { enabled = true }
            },
            render_modes = { "n", "c", "t" }
        }
    },
    -- TODO: Set below up for obsidian links
    -- {
    --     "epwalsh/obsidian.nvim",
    --     version = "*",
    --     lazy = true,
    --     ft = "markdown",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim"
    --     },
    --     opts = {
    --         workspaces = {
    --             {
    --                 name = "personal",
    --                 path = "~/Documents/Notes/Personal",
    --             }
    --         },
    --         completion = {
    --             nvim_cmp = true
    --         }
    --     }
    -- }
}
