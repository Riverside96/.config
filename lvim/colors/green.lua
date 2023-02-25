-- A green colorscheme
-- Maintainer:  https://github.com/julien
-- Last Change: 2022/09/21

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "green"

vim.cmd("hi ColorColumn ctermbg=40")
vim.cmd("hi Comment ctermfg=2")
vim.cmd("hi Constant ctermfg=40")
vim.cmd("hi CursorLine term=none cterm=none")
vim.cmd("hi Directory ctermfg=40")
vim.cmd("hi Folded ctermbg=40 ctermfg=0")
vim.cmd("hi Identifier ctermfg=40")
vim.cmd("hi LineNr ctermfg=2")
vim.cmd("hi MoreMsg ctermfg=40")
vim.cmd("hi NonText ctermfg=40")
vim.cmd("hi Normal ctermbg=0 ctermfg=40")
vim.cmd("hi Operator ctermfg=40")
vim.cmd("hi PreProc ctermfg=40")
vim.cmd("hi Search ctermbg=120")
vim.cmd("hi Special ctermfg=40")
vim.cmd("hi Statement cterm=bold ctermfg=40")
vim.cmd("hi StatusLineTerm ctermbg=15")
vim.cmd("hi StatusLineTerm term=none ctermbg=40 ctermfg=0")
vim.cmd("hi StatusLineTermNC ctermbg=15")
vim.cmd("hi StatusLineTermNC term=none ctermbg=40 ctermfg=0")
vim.cmd("hi String ctermfg=40")
vim.cmd("hi Todo cterm=none ctermfg=40 gui=none")
vim.cmd("hi Type ctermfg=40")
vim.cmd("hi Visual term=reverse ctermbg=120 ctermfg=0")
vim.cmd("hi VertSplit ctermfg=232 cterm=none")
vim.cmd("hi Question ctermfg=40")
vim.cmd("hi StatusLine cterm=none ctermfg=2 ctermbg=232")
vim.cmd("hi StatusLineNC cterm=none ctermfg=40 ctermbg=234")
vim.cmd("hi Pmenu ctermbg=232 ctermfg=40")
vim.cmd("hi MatchParen ctermbg=232 ctermfg=2")
vim.cmd("hi diffAdded ctermfg=2 cterm=none")
vim.cmd("hi diffRemoved ctermfg=1")
