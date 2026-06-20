return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtext_view_method = "zathura"
        -- vim.g.vimtex_view_forward_search_on_start = false
        -- vim.g.vimtex_compiler_latexmk = {
        --     aux_dir = "/home/oscar/.texfiles/",
        --     out_dir = "/home/oscar/.texfiles/",
        -- }
        vim.g.vimtex_compiler_latexmk = {
            out_dir = ".build"
        }
    end
}
