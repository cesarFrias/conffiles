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
Plugin 'bling/vim-airline'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'Tpope/vim-commentary'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'Rainbow-Parenthesis'
Plugin 'Townk/vim-autoclose'

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

" MinusculasMaiusculas: converte a primeira letra de cada frase p/MAIUSCULAS
map ,mm :set noic<cr>
       \:%s/\(\(\([.!?]\s*\\|^\s*\)\n^\\|[.?!-] \)\s*"\?\s*\)\([a-zàáéóú]\)/\1\U\4/cg<cr>

" TiraM:  Mapeamento para tirar os ^M do final das linhas
map ,tm :%s/\r//g<cr>

" PymodeLintAuto:  Mapeamento para executar PymodeLintAuto
map ,pla :PymodeLintAuto<cr>zz

" SubstituiTabPorEspaço: Substitui os caracteres \t (tab) por 4 espaços 
map ,ste :%s/\t/    /g<cr>       

" Acrescenta linha de comentário funcional UTF-8
map ,utf ggi# -*- coding: utf-8 -*-<cr>

" Cabecalho: Mapeamento para inserir cabeçalho python
map ,py i#!/usr/bin/python# -*- coding: utf-8 -*-# Desenvolvido por: Cesar Frias:r!date +"\%d/\%m/\%Y"<cr>i# Data: <end><cr><cr><cr>

" Mapeamento para inserir if __name__ == '__main__' python
map ,if :set paste<cr> iif __name__ == '__main__':<cr><esc>:set nopaste<cr>

map ,pt :set spell spelllang=pt<cr>
map ,en :set spell spelllang=en<cr>
map ,ns :set nospell<cr>
map ,u8 :set encoding=utf-8 termencoding=latin1<cr>
"
" Gundo - Graph undo tree
nnoremap <F4> :GundoToggle<CR>
let g:gundo_width = 30

map <F5> :NERDTreeToggle<return>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

map <F6> :TagbarToggle<CR>
let g:tagbar_width = 30

" Ruler e cursor sempre em branco
hi StatusLine ctermfg=white

" Faz os resultados da busca aparecerem no meio da tela
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" OPCOES DO SET
"(IncrementedSearch, HighLightedSearch, IgnoreCase, SmartCaSe)
set is hls ic scs magic         "opcoes espertas de busca
set title                       "Mostra titulo do arquivo  
set sm                          "ShowMatch: mostra o par do parenteses/chaves recem fechado
set hid                         "HIDden: undo mesmo depois de trocar de buffer 
set aw                          "AutoWrite: gravacao automatica a cada alteracao
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
colorscheme desert
syntax on               "ligando a sintaxe colorida
syn sync minlines=500   "nao faco ideia


" TXT: Arquivos texto tem tratamento especial
au BufNewFile,BufRead *.txt   set tw=120 ts=4 ft=txt "spell
au BufNewFile,BufRead *README,*NEWS,*TODO set ft=txt "spell


" Python: TAB colorido e outras configuracoes
au FileType python set ts=4 tw=100 et
au FileType python syn match pythonTAB '\t\+'
au FileType python set complete-=k/home/cesar/.vim/doc/pydiction-1.2/complete-dict complete+=k/home/cesar/.vim/doc/pydiction-1.2/complete-dict
au FileType python set omnifunc=pythoncomplete#Complete
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

nmap <space> :call ToggleFold()<CR>
" Espaço funcionando como o zf para Toggle sem indentação
vmap <space> zf<cr>
map ,rc :vsplit $MYVIMRC<cr>

"Mapeamentos para alterar o tamanho da janela
map <S-Left> <c-w><
map <S-Right> <c-w>>
map <S-Up> <c-w>+
map <S-Down> <c-w>-

hi Visual term=reverse cterm=reverse ctermfg=white ctermbg=black
hi LineNr ctermfg=DarkMagenta

" Busca colorida em verde
hi    Search ctermbg=green ctermfg=black
hi IncSearch ctermbg=black ctermfg=cyan

let g:pymode_virtualenv_path = $VIRTUAL_ENV
let g:pymode_folding = 0
let g:pymode_lint_on_fly = 1
let g:pymode_rope_complete_on_dot = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline_powerline_fonts = 1
let g:ctrlp_custom_ignore = '*.pyc'
let g:golden_ratio_exclude_nonmodifiable = 1
let g:dbext_default_SQLITE_bin = 'sqlite3'
