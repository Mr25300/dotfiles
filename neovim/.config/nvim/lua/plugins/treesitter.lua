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
            "c",
            "cpp",
            "python",
            "javascript",
            "typescript",
            "java",
            "html",
            "css",
            "glsl",
            "dockerfile",
            "markdown",
            "markdown_inline",
            "yaml",
            "json",
            "latex",
            "r"
        }
    }
}
