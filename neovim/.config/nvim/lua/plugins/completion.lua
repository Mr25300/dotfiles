return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets" -- For snippets
    },
    version = "1.*",
    event = "InsertEnter",

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "none",

            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "cancel", "fallback" },
            ["<C-y>"] = { "select_and_accept", "fallback" },

            ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
            ["<C-n>"] = { "select_next", "fallback_to_mappings" },

            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },

            -- While inside of a snippet
            ["<Tab>"] = { "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },

            -- Toggle argument display
            ["<C-k>"] = { "show_signature", "hide_signature", "fallback" }
        },
        appearance = {
            nerd_font_variant = "mono"
        },
        completion = {
            documentation = { auto_show = true }
        },
        signature = { enabled = true }, -- For displaying arguments while typing
        sources = {
            default = { "lsp", "path", "snippets", "buffer" }
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
