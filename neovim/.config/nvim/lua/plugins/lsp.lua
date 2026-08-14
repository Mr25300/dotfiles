return {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
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
                "bashls",
                "clangd",
                "pyright",
                "ts_ls",
                "html",
                "cssls",
                "markdown_oxide",
                "texlab" -- Make sure this is working
            }
        }

        vim.lsp.config("bashls", {
            filetypes = { "sh", "bash", "zsh" }
        })

        vim.lsp.config("texlab", {
            settings = {
                texlab = {
                    build = {
                        executable = "",
                        onSave = false
                    },
                    forwardSearch = {
                        executable = "",
                        args = {}
                    }
                }
            }
        })

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

                map("<leader>f", function()
                    vim.lsp.buf.format { async = true } -- Fix indentation here
                end, "[F]ormat Code")
            end
        })
    end
}
