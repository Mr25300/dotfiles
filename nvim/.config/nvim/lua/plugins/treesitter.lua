return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
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
            "markdown_inline"
        }
    }
}
