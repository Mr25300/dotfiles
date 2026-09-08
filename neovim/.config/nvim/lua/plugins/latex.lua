return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        local hostname = vim.loop.os_gethostname()

        if hostname == "sanctum" then
            vim.g.vimtex_view_method = "zathura_simple"
        else
            vim.g.vimtex_view_general_viewer = "okular"
            vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
        end

        vim.g.vimtex_compiler_latexmk = {
            aux_dir = "build",
            out_dir = "build"
        }
    end
    -- TODO: Add custom surroundings as seen here:
    -- https://www.lorenzobettini.it/2026/04/neovim-and-latex-with-lazyvim-part-3-custom-commands/
}
