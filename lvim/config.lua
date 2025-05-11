-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- custom page movement keymaps from ThePrimeagean
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<S-p>", [["_dP]]) -- copy back pasted item into buffer!

-- custom keymap (personal) based on the above
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<S-g>", "<S-g>zz")

-- custom keymap from https://www.reddit.com/r/neovim/comments/zjxx7o/how_can_i_center_the_first_search_item/
vim.keymap.set("c", "<CR>", function()
    return vim.fn.getcmdtype() == "/" and "<CR>zzzv" or "<CR>"
end, { expr = true })

-- https://github.com/nvim-lua/kickstart.nvim/blob/6f6f38a6b5059787d8d92b313f6e1b2c722389b0/init.lua#L196-L205
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- remove lunarvim default key bindings for vim-tmux-navigator plugin
lvim.keys.normal_mode["<C-h>"] = false
lvim.keys.normal_mode["<C-j>"] = false
lvim.keys.normal_mode["<C-k>"] = false
lvim.keys.normal_mode["<C-l>"] = false

lvim.colorscheme = "catppuccin.mocha"

lvim.builtin.project.patterns = { "=.config", "=.scripts", "=homer", "go.mod", ".git", "_darcs", ".hg", ".bzr", ".svn",
    "Makefile", "package.json" }

lvim.plugins = {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<C-h>",  "<cmd><C-U>TmuxNavigateLeft<CR>" },
            { "<C-j>",  "<cmd><C-U>TmuxNavigateDown<CR>" },
            { "<C-k>",  "<cmd><C-U>TmuxNavigateUp<CR>" },
            { "<C-l>",  "<cmd><C-U>TmuxNavigateRight<CR>" },
            { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<CR>" },
        },
    },
    {
        "fatih/vim-go",
    },
}
