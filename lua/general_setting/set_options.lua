vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = {'utf-8', 'gbk', 'gb18030', 'gb2312', 'latin1', 'cp936'}
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

vim.o.shell = "pwsh"
--thanks to the good sir from reddit. Fix the neovim shell command encoding problem using powershell 7.x version.
--https://www.reddit.com/r/neovim/comments/1crdv93/neovim_on_windows_using_windows_terminal_and/
vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command $PSStyle.OutputRendering = 'PlainText';"
vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.opt.shellxquote = ""
vim.opt.shellquote = ""
vim.opt.guicursor = "i:blinkon100"
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '..>', trail = ' ', nbsp = '~' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

--Clear font italics on 'ColorScheme' event
vim.api.nvim_create_autocmd("ColorScheme", {
    desc = "Clear Colorscheme italics",
    group = vim.api.nvim_create_augroup("clear_italics", { clear = true }),
    callback = function()
        vim.cmd.hi("Boolean gui=none cterm=NONE")
        vim.cmd.hi("Character gui=none cterm=NONE")
        vim.cmd.hi("Constant gui=none cterm=NONE")
        vim.cmd.hi("SpecialKey gui=none cterm=NONE")
        vim.cmd.hi("String gui=none cterm=NONE")
        vim.cmd.hi("TSKeyword gui=none cterm=NONE")
        vim.cmd.hi("WhichKeyValue gui=none cterm=NONE")
        vim.cmd.hi("TroubleSource gui=none cterm=NONE")
        vim.cmd.hi("Comment gui=none, cterm=none")
    end,
})
