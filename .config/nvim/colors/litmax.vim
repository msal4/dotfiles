runtime colors/habamax.vim
set background=light
let g:colors_name = "litmax"

" Core: dark ink on warm parchment
hi Normal        guibg=#e8eae2 guifg=#252a22 gui=NONE  cterm=NONE

" Inverted selection: dark green text on soft sage wash
hi Visual        guifg=#2a3a29 guibg=#c4d6c2 gui=NONE  cterm=NONE

" Bracket match: deep grass fg on pale lime bg (mirrors #76ab1a / #34401f)
hi MatchParen    guifg=#3d6300 guibg=#cede8a gui=bold  cterm=bold

" Keep hue, darken significantly for readability on light bg
hi Statement     ctermfg=darkyellow guifg=#7a6612

" Neutral text elements (mirrors fg-colored Identifier)
hi Identifier    guifg=#252a22 guibg=NONE    gui=NONE  cterm=NONE

" Muted sage → darkened to maintain contrast (mirrors #99ad99)
hi Type          guifg=#3d5e3d guibg=NONE    gui=NONE  cterm=NONE

" Comments: medium warm gray (often unset in habamax, good to add)
hi Comment       guifg=#7a7a68              gui=italic cterm=NONE

" LineNr / gutter: subtle, doesn't compete
hi LineNr        guifg=#9a9e8e guibg=#dfe1d8
hi CursorLineNr  guifg=#3d6300 guibg=#dfe1d8 gui=bold  cterm=bold

" Cursor line: barely-there tint
hi CursorLine    guibg=#dde0d6              gui=NONE  cterm=NONE

" Search: warm amber highlight
hi Search        guifg=#252a22 guibg=#e0c96a
hi IncSearch     guifg=#252a22 guibg=#c8a830 gui=bold  cterm=bold

" Pmenu (completion popup)
hi Pmenu         guifg=#252a22 guibg=#ced1c6
hi PmenuSel      guifg=#e8eae2 guibg=#3d6300

" Status line
hi StatusLine    guifg=#e8eae2 guibg=#3d5e3d gui=NONE  cterm=NONE
hi StatusLineNC  guifg=#7a7a68 guibg=#c4c7bc gui=NONE  cterm=NONE

" Splits / borders
hi VertSplit     guifg=#b0b3a8 guibg=#b0b3a8

" Errors / warnings
hi Error         guifg=#8b1a1a guibg=#f2d0d0
hi WarningMsg    guifg=#7a6612
