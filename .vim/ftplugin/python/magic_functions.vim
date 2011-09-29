"César Frias
python << EOF

import vim

def create_function():
    function_line = int(vim.eval("line('.')")) + 1    
    current_line = vim.current.line
    indentation = re.search("^ *", current_line).group()
    indentation = (len(indentation) - 4) * ' '
    vim.current.buffer.append(indentation + 'def default_function(%s):' % ('self' if indentation else ''), function_line)
    vim.current.buffer.append(2 * indentation + 'pass', function_line + 1)

vim.command('map ,cf :py create_function()<cr>')

def create_class():
    function_line = int(vim.eval("line('.')")) + 2
    current_line = vim.current.line
    indentation = re.search("^ *", current_line).group()
    vim.current.buffer.append(indentation + 'class DefaultClass():', function_line)
    vim.current.buffer.append(indentation + '    def __init__(self):', function_line + 2)
    vim.current.buffer.append(indentation + '        pass', function_line + 3)

vim.command('map ,cc :py create_class()<cr>')

EOF
