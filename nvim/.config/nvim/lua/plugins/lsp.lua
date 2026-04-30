return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        {
            "williamboman/mason.nvim",
            opts = {}
        },
        "neovim/nvim-lspconfig",
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {}
        }
    },
    config = function()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "clangd",
                "pyright"
            }
        }

        local keymap = vim.keymap

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
                map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
                map("K",  vim.lsp.buf.hover, "Hover Documentation")
                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame variable")
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                map("<leader>e", vim.diagnostic.open_float, "Show diagnostic [E]rror")
            end
        })
    end
}
