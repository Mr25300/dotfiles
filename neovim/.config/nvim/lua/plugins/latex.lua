return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "zathura_simple"
        vim.g.vimtex_compiler_latexmk = {
            aux_dir = "build",
            out_dir = "build"
        }
    end
    -- TODO: Add custom surroundings as seen here:
    -- https://www.lorenzobettini.it/2026/04/neovim-and-latex-with-lazyvim-part-3-custom-commands/
}
