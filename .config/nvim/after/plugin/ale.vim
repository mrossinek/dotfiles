let g:ale_completion_enabled = 0  " handled by deoplete
let g:ale_lint_on_text_changed = 'normal'
let g:ale_linters_explicit = 1
let g:ale_linters =     {
                        \       'cpp': ['clangd', 'gcc'],
                        \       'cuda': ['nvcc'],
                        \       'haskell': ['hie', 'ghc'],
                        \       'help': [],
                        \       'java': ['javalsp', 'checkstyle'],
                        \       'markdown': ['prettier'],
                        \       'python': ['pyls', 'pylint', 'flake8'],
                        \       'sh': ['shellcheck'],
                        \       'tex': ['texlab', 'chktex'],
                        \       'text': [],
                        \       'vim': ['vint'],
                        \}
let g:ale_linter_aliases =      {
                                \       'bash': 'sh',
                                \       'c': 'cpp',
                                \       'html': 'markdown',
                                \       'json': 'markdown',
                                \       'latex': 'tex',
                                \       'plaintex': 'tex',
                                \       'plaintext': 'text',
                                \       'zsh': 'sh',
                                \}
let g:ale_fixers =      {
                        \       'python': ['autopep8'],
                        \
                        \}
let g:ale_python_pyls_executable = expand('~/Installations/pynvim3/.direnv/python-3.*/bin/pyls')

nnoremap <leader>ad :ALEDetail<cr>
