--------------------------------------------------------------
-- Rust LSP specific configuration
--------------------------------------------------------------

local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

M = {}
M.settings = {
    ["rust-analyzer"] = {
        assist = {
            importGranularity = "module",
            importPrefix = "self",
        },
        cargo = {
            loadOutDirsFromCheck = true,
        },
        procMacro = {
            enable = true,
        },
        lens = {
            enabled = true,
        },
        --[[ check = {}, ]]
        checkOnSave = {
            command = "clippy",
        },
        inlayHints = {
            enable = true,
            lifetimeElisionHints = {
                enable = true,
            },
        },
    }
}

M.tools = {
    tools = {
        on_initialized = function()
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
                pattern = { "*.rs" },
                callback = function()
                    vim.lsp.codelens.refresh()
                end,
            })
        end,
        inlay_hints = {
            parameter_hints_prefix = " ",
            other_hints_prefix = " ",
        },
    },
}

M.dap = {
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
}

return M
