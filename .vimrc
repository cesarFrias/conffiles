          "Vimrc de Cesar Frias, com ajuda de Oreio e Flávio Amieiro

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

" SubstituiTabPorEspaço: Substitui os caracteres \t (tab) por 4 espaços 
map ,ste :%s/\t/    /g<cr>       

" Acrescenta linha de comentário funcional UTF-8
map ,utf i# -*- coding: utf-8 -*-<cr>

" Cabecalho: Mapeamento para inserir cabeçalho python
map ,py i#!/usr/bin/python# -*- coding: utf-8 -*-# Desenvolvido por: Cesar Frias:r!date +"\%d/\%m/\%Y"<cr>i# Data: <end><cr><cr><cr>

" Mapeamento para inserir if __name__ == '__main__' python
map ,if :set paste<cr> iif __name__ == '__main__':<cr><esc>:set nopaste<cr>

map ,pt :set spell spelllang=pt<cr>
map ,en :set spell spelllang=en<cr>
map ,ns :set nospell<cr>
map ,u8 :set encoding=utf-8 termencoding=latin1<cr>

" Para 'ocultar' e voltar os comentarios do arquivo atual
noremap <F2> :hi Comment ctermfg=black guifg=black<cr>
noremap <F3> :hi Comment term=bold ctermfg=cyan guifg=cyan<cr>
"
" Gundo - Graph undo tree
nnoremap <F4> :GundoToggle<CR>
let g:gundo_width = 30

"PEP8
let g:pep8_map='<F10>'


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
set nosmartindent               "desligando pois esta padrao no CL40
set visualbell                  "pisca a tela ao inves de bipar
set nojoinspaces                "! coloca 2 espacos apos o . quando usando o gq
set sw=4                        "numero de colunas para o comando > (ShiftWidth)
set wildmode=longest,list:full  "para completacao do TAB igual bash
set number                      "mostra o numero de linhas
set mouse=a                     "habilita o uso do mouse
set statusline+=%{virtualenv#statusline()} "Coloca o nome do virtualenv ativado na barra de status
set statusline+=%{fugitive#statusline()} "Coloca a branch do git na barra de status

retab                           "converter os TABs ja existentes

"Mantendo minha sanidade mental
cab Q q
cab W w
cab Wq wq
cab wQ wq
cab WQ wq


" CORES
" Cores no terminal com a sintaxe
set background=dark     "eh importante o bg estar ANTES do terminfo
colorscheme jelleybeans
syntax on               "ligando a sintaxe colorida
syn sync minlines=500   "nao faco ideia


" TXT: Arquivos texto tem tratamento especial
au BufNewFile,BufRead *.txt   set tw=120 ts=4 ft=txt "spell
au BufNewFile,BufRead *README,*NEWS,*TODO set ft=txt "spell


" Python: TAB colorido e outras configuracoes
au FileType python set ts=4 tw=100 et
au FileType python syn match pythonTAB '\t\+'
au FileType python hi pythonString ctermfg=lightgreen
au FileType python hi pythonRawString ctermfg=lightgreen
au FileType python inoremap [ []<LEFT>
au FileType python inoremap { {}<LEFT>
au FileType python inoremap ( ()<LEFT>
au FileType python inoremap " ""<LEFT>
au FileType python inoremap ' ''<LEFT>
"au FileType python set complete-=k/home/cesar/.vim/doc/pydiction-1.2/complete-dict complete+=k/home/cesar/.vim/doc/pydiction-1.2/complete-dict
au FileType python set omnifunc=pythoncomplete#Complete
"Mostra caracteres que passaram de 79 colunas
au FileType python highlight OverLength ctermfg=red
au FileType python match OverLength /\%80v.*/
"Shift+Tab funcionando como <
au FileType python inoremap <S-Tab> :<<cr>i
au FileType python syn keyword booleans True False
au FileType python hi booleans ctermfg=blue

" C: Algumas configurações automáticas
au FileType c inoremap [ []<LEFT>
au FileType c inoremap { {}<LEFT><CR><CR><UP>
au FileType c inoremap ( ()<LEFT>
au FileType c inoremap " ""<LEFT>
au FileType c inoremap ' ''<LEFT>
set guioptions=a

" Php: Autocomplete e outras configuracoes
au FileType php inoremap [ []<LEFT>
au FileType php inoremap { {}<LEFT>
au FileType php inoremap ( ()<LEFT>
au FileType php inoremap " ""<LEFT>
au FileType php inoremap ' ''<LEFT>
au FileType php set complete-=k/home/cesar/.vim/doc/php/php.txt complete+=k/home/cesar/.vim/doc/php/php.txt

" Css: Autocomplete e outras configuracoes
au FileType css inoremap [ []<LEFT>
au FileType css inoremap { {}<LEFT>
au FileType css inoremap ( ()<LEFT>
au FileType css inoremap " ""<LEFT>
au FileType css inoremap ' ''<LEFT>
au FileType css set complete-=k/home/cesar/.vim/doc/css/css.txt complete+=k/home/cesar/.vim/doc/css/css.txt

" arduino: Syntax highligthning
autocmd! BufNewFile,BufRead *.pde,*.ino setlocal ft=arduino syntax=c.vim
au FileType arduino inoremap [ []<LEFT>
au FileType arduino inoremap { {}<LEFT><CR><CR><UP>
au FileType arduino inoremap ( ()<LEFT>
au FileType arduino inoremap " ""<LEFT>
au FileType arduino inoremap ' ''<LEFT>

" Html: Algumas configurações automáticas
au FileType htmldjango inoremap {<CR>  {<CR><CR>}<UP>
au FileType htmldjango inoremap {{ {{  }}<LEFT><LEFT><LEFT>
au FileType htmldjango inoremap ( ()<LEFT>
au FileType htmldjango inoremap " ""<LEFT>
au FileType htmldjango inoremap ' ''<LEFT>
au FileType htmldjango inoremap < <><LEFT>
au FileType htmldjango inoremap {% {%  %}<LEFT><LEFT><LEFT>
" Mostra os espaços em branco inuteis no final da linha 
au BufNewFile,BufRead * syn match brancomala '\s\+$' | hi brancomala ctermbg=red

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

map <F9> :NERDTree<return>
map <F9> :NERDTreeToggle<return>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

map ,rc :vsplit $MYVIMRC<cr>

"Mapeamentos para alterar o tamanho da janela
map <S-Left> <c-w><
map <S-Right> <c-w>>
map <S-Up> <c-w>+
map <S-Down> <c-w>-

" Espaço funcionando como o zf para Toggle sem indentação
vmap <space> zf<cr>

python << EOF
# Enquanto não encontrar end of file vai interpretar python
import vim
import re

SKIP_TEST_STRING = "from nose.plugins.skip import SkipTest; raise SkipTest()"

def set_skip_test():
    function_starts = "?def"
    vim.command(function_starts)
    skip_line = int(vim.eval("line('.')"))
    current_line = vim.current.line
    indentation = re.search("^ *", current_line).group()
    indentation += '    '
    #Corrige indentacao (pode nao ter linhas apos a definicao da funcao)
    vim.current.buffer.append(indentation + SKIP_TEST_STRING, skip_line)

vim.command('map <F7> :py set_skip_test()<cr>')

def killall_skip_test():
    command = "g/^ *%s/d" % SKIP_TEST_STRING 
    vim.command(command)

vim.command('map <F8> :py killall_skip_test()<cr>')

import os
def open_imported_file():
    import_line = vim.current.line
    try:
        exec(import_line)
        if import_line.startswith('import'):
            module = import_line.split()[-1]
        else:
            module = import_line.split()[1]
        if module in os.sys.modules:
            file_name = os.sys.modules[module].__file__
            if file_name.endswith('pyc'):
                vim.command('split %s' % file_name[:-1])
            elif file_name.endswith('so'):
                print 'Arquivo binário'
    except ImportError, error:
        print 'Não foi possível importar esse método (%s)' % error


vim.command('map <C-S-O> :py open_imported_file()<cr>')     

EOF

map ,ct :TagbarToggle<CR>

execute pathogen#infect()

let g:django_projects = '~/Workspace/'
let g:django_activate_virtualenv = 1

hi Visual term=reverse cterm=reverse
hi LineNr ctermfg=DarkMagenta

" Busca colorida em verde
hi    Search ctermbg=green ctermfg=black
hi IncSearch ctermbg=black ctermfg=cyan

autocmd BufWritePost *.py call Flake8() 
