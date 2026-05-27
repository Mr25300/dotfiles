return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        indent = { enable = true },
        highlight = { enable = true },
        folds = { enable = true },
        ensure_installed = {
            "lua",
            "bash",
            "zsh",
            "c",
            "cpp",
            "python",
            "html",
            "javascript",
            "typescript",
            "markdown",
            "markdown_inline",
            "latex",
            "yaml",
            "json"
        }
    }
}
