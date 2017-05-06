          "Vimrc de Cesar Frias, com ajuda de Oreio e Flávio Amieiro
          "
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'gregsexton/gitv'
Plugin 'roman/golden-ratio'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'klen/python-mode'
Plugin 'vim-airline/vim-airline'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'Tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/NERDTree'
Plugin 'fs111/pydoc.vim'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/syntastic'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/upAndDown'
" Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/MatchTagAlways'
Plugin 'justinmk/vim-sneak'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'skwp/greplace.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'dbext.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'jiangmiao/auto-pairs'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

source ~/.db_connections
" Guarda posicao do cursor e historico da linha de comando :
set viminfo='10,\"30,:40,%,n~/.viminfo
au BufReadPost * if line("'\"")|execute("normal `\"")|endif

" Checa se houve alguma modificação externa no arquivo ao mover o cursor
" Normal or Insert mode
au CursorMoved,CursorMovedI * checktime

" MostraTab: mostra TAB no inicio e espacos no fim das linhas
map ,mt /^\t\+\\|\s\+$<cr>

" PalavrasRepetidas: procura palavras repetidas no texto
map ,pr /\<\(\w*\) \1\><cr>

map ,pt :set spell spelllang=pt<cr>
map ,en :set spell spelllang=en<cr>
map ,ns :set nospell<cr>
map ,u8 :set encoding=utf-8 termencoding=latin1<cr>

map <F3> :MBEToggle<return>
map <F4> :NERDTreeFind<return>
map <F5> :NERDTreeToggle<return>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.xls.*$', '\tags$']
let NERDTreeWinSize = 30

map <F6> :TagbarToggle<CR>
let g:tagbar_width = 25

" Faz os resultados da busca aparecerem no meio da tela
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap G Gzz

" OPCOES DO SET
"(IncrementedSearch, HighLightedSearch, IgnoreCase, SmartCaSe)
set is hls ic scs magic         "opcoes espertas de busca
set title                       "Mostra titulo do arquivo
set sm                          "ShowMatch: mostra o par do parenteses/chaves recem fechado
set hid                         "HIDden: undo mesmo depois de trocar de buffer
set ai                          "AutoIndent: identacao automatica
set ts=4                        "TabStop: numero de caracteres de avanco do TAB
set report=0                    "reporta acoes com linhas
set shm=filmnrwxt               "SHortMessages: encurta as mensagem do rodape
set et                          "ExpandTab: troca TABs por espacos
set ruler                       "mostra a posicao do cursor, regua
set laststatus=2                "mostra N linhas de estado (status)
set textwidth=120               "quebra de linha
set bs=2                        "comportamento do backspace
"set nosmartindent               "desligando pois esta padrao no CL40
set visualbell                  "pisca a tela ao inves de bipar
set nojoinspaces                "! coloca 2 espacos apos o . quando usando o gq
set sw=4                        "numero de colunas para o comando > (ShiftWidth)
set wildmode=longest,list:full  "para completacao do TAB igual bash
set number                      "mostra o numero de linhas
set mouse=a                     "habilita o uso do mouse
set statusline+=%{virtualenv#statusline()} "Coloca o nome do virtualenv ativado na barra de status
set statusline+=%{fugitive#statusline()} "Coloca a branch do git na barra de status
set splitright

retab                           "converter os TABs ja existentes

filetype plugin indent on
"Mantendo minha sanidade mental
cab Q q
cab W w
cab Wq wq
cab wQ wq
cab WQ wq


" CORES
" Cores no terminal com a sintaxe
set background=dark     "eh importante o bg estar ANTES do terminfo
colorscheme monokai
syntax on               "ligando a sintaxe colorida
syn sync minlines=500   "nao faco ideia


" TXT: Arquivos texto tem tratamento especial
au BufNewFile,BufRead *.txt   set tw=120 ts=4 ft=txt "spell
au BufNewFile,BufRead *README,*NEWS,*TODO set ft=txt "spell
au BufNewFile,BufRead *empresa_conf set ft=sh "spell

au FileType ruby,javascript set ts=2 sw=2 tw=100 et si
au FileType ruby syn keyword Debug byebug
au FileType ruby hi Debug ctermfg=yellow

" Python: TAB colorido e outras configuracoes
au FileType python set ts=4 tw=100 et
au FileType python syn match pythonTAB '\t\+'
"Mostra caracteres que passaram de 79 colunas
au FileType python highlight OverLength ctermfg=red
au FileType python match OverLength /\%80v.*/
"Shift+Tab funcionando como <
au FileType python inoremap <S-Tab> :<<cr>i
au FileType python hi pythonString ctermfg=lightgreen
au FileType python hi pythonRawString ctermfg=lightgreen
au FileType python hi pythonUniString ctermfg=lightgreen
au FileType python map <buffer> <F8> :call Flake8()<cr>

" Guardar info da sintaxe desde o inicio do arquivo (nao se perde, fica lento)
syn sync fromstart

"Code folding
function ToggleFold()
   if foldlevel('.') == 0
      " No fold exists at the current line,
      " so create a fold based on indentation

      let l_min = line('.') " the current line number
      let l_max = line('$') " the last line number
      let i_min = indent('.') " the indentation of the current line
      let l = l_min + 1

      " Search downward for the last line whose indentation > i_min
      while l <= l_max
         " if this line is not blank ...
         if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
            if indent(l) <= i_min

               " we've gone too far
               let l = l - 1 " backtrack one line
               break
            endif
         endif
         let l = l + 1
      endwhile

      " Clamp l to the last line
      if l > l_max
         let l = l_max
      endif

      " Backtrack to the last non-blank line
      while l > l_min
         if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
            break
         endif
         let l = l - 1
      endwhile

      "execute "normal i" . l_min . "," . l . " fold" " print debug info

      if l > l_min
    " " Create the fold from l_min to l
         execute l_min . "," . l . " fold"
      endif
   else
      " Delete the fold on the current line
      normal zd
   endif
endfunction

nmap <f2> :call ToggleFold()<CR>
" Espaço funcionando como o zf para Toggle sem indentação
vmap <f2> zf<cr>

let mapleader=" "
map <Leader>t :!ctags -R .<CR>
map <Leader>p :CtrlPTag <CR>
map <Leader>rc :vsplit $MYVIMRC<CR>
map <Leader>ac :Ack!<space>
map <Leader>af :AckFromSearch!<CR>
map <Leader>gc :Gcommit -m'
map <Leader>gp :Gpush<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>wa :VimwikiAll2HTML<CR>
" Mapeamento para executar PymodeLintAuto
map <Leader>pla :PymodeLintAuto<cr>zz

" RSpec.vim mappings
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

vnoremap <Leader>y "*y<CR>

"Mapeamentos para alterar o tamanho da janela
map <A-Left> <c-w><
map <A-Right> <c-w>>
map <A-Up> <c-w>+
map <A-Down> <c-w>-

map ; :
inoremap ;; <ESC>

hi    Search ctermbg=black ctermfg=gray
hi IncSearch ctermbg=blue ctermfg=black
hi Visual term=reverse cterm=reverse ctermfg=black ctermbg=gray
hi LineNr ctermfg=gray ctermbg=black
hi CursorLine cterm=bold ctermbg=none ctermfg=none
hi CursorLineNr ctermfg=darkblue ctermbg=black
set cursorline

let g:pymode_virtualenv_path = $VIRTUAL_ENV
let g:pymode_folding = 0
let g:pymode_lint_on_fly = 1
let g:pymode_lint_cwindow = 0
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_autoimport = 1
let g:pymode_rope_goto_definition_cmd = 'vs'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_powerline_fonts = 1
let g:golden_ratio_exclude_nonmodifiable = 1
let g:ctrlp_custom_ignore = '\v\.(pyc)$'

let g:ackprg =
      \ "ack -H --nocolor --nogroup --column --smart-case --follow --ignore-dir log/ --ignore-dir coverage/ --ignore-dir vendor/ --ignore-dir specs/ --ignore-file=is:tags"
let g:ack_autoclose = 1
let g:ackhighlight = 1
let g:ack_use_dispatch = 1

" Syntastic Checkers
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <F7> :SyntasticCheck<CR>:redraw!<CR>

let g:tagbar_updateonsave_maxlines = 1000
let g:sneak#streak = 1
let g:golden_ratio_autocommand = 0
au VimEnter * GoldenRatioToggle


let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/local/bin/jsctags'
\ }

let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
let wiki_1.html_template = 'bootstrap.tpl'
let g:vimwiki_list = [wiki_1]
