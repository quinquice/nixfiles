local treesitter = require("nvim-treesitter.configs")
treesitter.setup {
    ensure_installed = {
        "c", "lua", "bibtex", "cmake", "cpp", "css", "dockerfile", "elixir",
        "html", "javascript", "json", "latex", "lua", "make", "nix", "ocaml",
        "python", "scss", "toml", "typescript", "yaml", "zig"
    },
    highlight = {enable = true}
}
