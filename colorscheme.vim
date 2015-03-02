set t_Co=256
let g:solarized_termtrans=1
set background=light
colorscheme solarized

syntax on                   " Syntax highlighting
set cursorline " Highlight current line
"hi CursorLine term=bold cterm=bold

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
highlight clear CursorLineNr    " Remove highlight color from current line number

set splitbelow        " new hoz splits go below
set splitright        " new vert splits go right

set fillchars=vert:│,diff:⎼,fold:⎼
