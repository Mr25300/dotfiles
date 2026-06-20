return {
    -- {
    --     "iamcco/markdown-preview.nvim",
    --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --     build = "cd app && npm install",
    --     init = function()
    --         vim.g.mkdp_filetypes = { "markdown" }
    --     end,
    --     ft = { "markdown" }
    -- },
    {
        'brianhuster/live-preview.nvim', -- TODO: 
        dependencies = {
            'nvim-telescope/telescope.nvim'
        }
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-mini/mini.icons"
        },

        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
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
