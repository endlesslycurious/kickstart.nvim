-- custom config  - overriding things in ../../init.lua

-- tab key bindings
local tab_bindings = function()
  vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = '[T]ab [N]ew' })
  vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = '[T]ab [C]lose' })
  vim.keymap.set('n', '<leader>tt', ':tabnext<CR>', { desc = '[T]ab next' })
  vim.keymap.set('n', '<leader>TT', ':tabprev<CR>', { desc = '[T]ab prev' })
  vim.keymap.set('n', '<leader>tT', ':tabprev<CR>', { desc = '[T]ab prev' })
  vim.keymap.set('n', '<leader>t1', '1gt', { desc = '[T]ab [1]' })
  vim.keymap.set('n', '<leader>t2', '2gt', { desc = '[T]ab [2]' })
  vim.keymap.set('n', '<leader>t3', '3gt', { desc = '[T]ab [3]' })
  vim.keymap.set('n', '<leader>t4', '4gt', { desc = '[T]ab [4]' })
  vim.keymap.set('n', '<leader>t5', '5gt', { desc = '[T]ab [5]' })
  vim.keymap.set('n', '<leader>t6', '6gt', { desc = '[T]ab [6]' })
  vim.keymap.set('n', '<leader>t7', '7gt', { desc = '[T]ab [7]' })
  vim.keymap.set('n', '<leader>t8', '8gt', { desc = '[T]ab [8]' })
  vim.keymap.set('n', '<leader>t9', '9gt', { desc = '[T]ab [9]' })
  vim.keymap.set('n', '<leader><tab>', ':tabnext<CR>', { desc = 'tab next' })
  vim.keymap.set('n', '<leader><s-tab>', ':tabprev<CR>', { desc = 'tab prev' })

  -- bind with which-key
  local status, wk = pcall(require, 'which-key')
  if status then
    wk.register {
      ['<leader>t'] = { name = 'Tab stuff', _ = 'which_key_ignore' },
    }
  end
end

-- fzf setup
--
-- For best experience, install ripgrep, sd, bat, fzf, fd-find (fd),
--     also recommend du-dust (dust), tealdeer
-- and
vim.cmd [[
  let g:fzf_layout = { 'down': '~80%' }
  let g:fzf_history_dir = '~/.local/share/fzf-history'
  let g:fzf_preview_window = ['hidden,right,50%,<70(hidden,up,40%)', 'ctrl-/']
  if has("win32") || has("win64")
    let g:fzf_preview_window = ['hidden,right,50%', 'ctrl-/']
  " let g:fzf_preview_bash = 'C:/Users/andyl/scoop/apps/git/current/bin/bash.exe'
  endif

  " override environment variables
  if executable("rg")
    let $FZF_DEFAULT_COMMAND='rg --files ' " --no-ignore-vcs'
  endif
  if executable("fd")
    let $FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
  endif
  let $FZF_PREVIEW_COMMAND="bat --style=numbers,changes --wrap never --color always {}"
  
  let fzf_default_opts="--ansi --layout reverse --margin=1,4" 
  let fzf_default_opts.=" --bind shift-up:preview-half-page-up,shift-down:preview-half-page-down" 
  let fzf_default_opts.=" --bind ctrl-k:kill-line"
  " let fzf_default_opts.=" --bind page-up:half-page-up,page-down:half-page-down" 
  let $FZF_DEFAULT_OPTS=fzf_default_opts

  " make FZF window look a bit more 'normal', kill status bar, no-ruler
  " autocmd! FileType fzf
  " autocmd  FileType fzf set laststatus=0 noshowmode noruler
  " \| autocmd BufLeave <buffer> set laststatus=3 showmode ruler
  
  
  " allow escape to quit FZF windows
  tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
]]

local fzf_color_setup = function()
  vim.cmd [[
  " force colors to match scheme
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
  ]]
end

-- fzf bindings
vim.keymap.set('n', '<leader>bb', ':Buffers<CR>', { desc = 'Search Buffers via FZF' })
vim.keymap.set('n', '<leader>ff', ':Files<CR>', { desc = 'Search Files via FZF' })
vim.keymap.set('n', '<leader>mm', ':FZFMru<CR>', { desc = 'Search MRU via FZF' })

-- QGrep FZF integration
-- <leader>qp  - select qgrep project/s - use tab to multi-select
-- <leader>qf  - qgrep file list
-- <leader>qg  - qgrep fzf
-- <leader>qG  - qgrep live fzf
-- <leader>qw  - qgrep word under cursor
--
-- new commands, :QP    --- select projects
--               :QF    --- qgrep files, with optional filter
--               :QG    --- qgrep with optional filter
--               :QGrep --- live qgrep with optional filter
--               :QGU   --- auto update the selected projects
vim.cmd [[
  " global state, this persists between sessions
  if exists("g:QGREP_PROJLIST") == 0
      let g:QGREP_PROJLIST = ""
  endif

  " update local state from global state
  function! s:qgrep_set_state(prompt)
    let g:qgrep_prompt = '--prompt="'.a:prompt
    let g:qgrep_prompt .= (g:qgrep_prompt[len(g:qgrep_prompt)-1] != ' ' ? " " : "").'> "'
    let g:qgrep_filter = ''
    if executable('sd')
      if has("win32") || has("win64") 
        " case insensitive filesytem
        let g:qgrep_filter = '| sd -f i ^' .substitute(getcwd(), '\\', '/', 'g') .' .'
      else
        " case sensitive filesytem
        let g:qgrep_filter = '| sd ^' .getcwd() .' .'
      endif
    end
  endfunction

  "-- qgrep project selection
  function! s:qgrep_fzfsink_proj(var)
    if len(a:var)
      let g:QGREP_PROJLIST = join(a:var, ",")
    endif
    " let &grepprg = 'qgrep search ' . g:QGREP_PROJLIST
  endfunction
  command! -bang -nargs=* QP
  \ call s:qgrep_set_state("QGrepProjects[".g:QGREP_PROJLIST."]") |
  \ call fzf#run(fzf#wrap({'source': 'qgrep projects ', 
  \                        'options': '--multi  --bind alt-a:select-all,alt-d:deselect-all ' .g:qgrep_prompt,
  \                        'sink*' : function('s:qgrep_fzfsink_proj')}))

  "-- qgrep files
  function! s:qgrep_fzfsink_edit(var)
    if len(a:var) > 0 
      let sortedFileList = sort(a:var)
      execute "e " . sortedFileList[0]
      if len(sortedFileList) > 1 
        let queryList = []
        for file in sortedFileList
          call add(queryList, {'filename': simplify(file), 'lnum': 1})
        endfor
        call setqflist(queryList)
        cwindow
      endif
    endif
  endfunction
  command! -bang -nargs=* QF
  \ call s:qgrep_set_state("QGrepFiles[".g:QGREP_PROJLIST."] ".(<q-args>)) |
  \ call fzf#run(fzf#vim#with_preview(extend({'source': 'qgrep files ' .g:QGREP_PROJLIST. ' '.shellescape(<q-args>) . g:qgrep_filter,
  \             'options': g:qgrep_prompt . ' --multi --bind alt-a:select-all,alt-d:deselect-all',
  \             'sink*' : function('s:qgrep_fzfsink_edit')}, g:fzf_layout), 
  \             g:fzf_preview_window[0], g:fzf_preview_window[1]))

  "-- qgrep grep
  command! -bang -nargs=* QG
  \ call s:qgrep_set_state("QGrep[".g:QGREP_PROJLIST."] ".(<q-args>)) |
  \ call fzf#vim#grep(
  \   'qgrep search ' .g:QGREP_PROJLIST ." H " .shellescape(<q-args>) .g:qgrep_filter, 0,
  \   fzf#vim#with_preview({'options': ''.g:qgrep_prompt .' --delimiter : --nth 3..'}, g:fzf_preview_window[0], g:fzf_preview_window[1]),
  \  <bang>0)
  
  "-- qgrep grep word
  command! -bang -nargs=* QGW
  \ call s:qgrep_set_state("QGrep[".g:QGREP_PROJLIST."] ".(expand("<cword>"))) |
  \ call fzf#vim#grep(
  \   'qgrep search ' .g:QGREP_PROJLIST ." H l " .shellescape(expand('<cword>')) . g:qgrep_filter, 0,
  \   fzf#vim#with_preview({'options': ''.g:qgrep_prompt .' --delimiter : --nth 3..'}, g:fzf_preview_window[0], g:fzf_preview_window[1]),
  \  <bang>0)

  "-- qgrep current projects
  function! s:qgrepUpdate()
      return ":!qgrep update " . g:QGREP_PROJLIST
  endfunction
  command! -bang -nargs=* QGU exec s:qgrepUpdate()

  "-- qgrep live grep
  function! s:qgrepFzf(query, fullscreen)
    let prompt = "QGrep live[".g:QGREP_PROJLIST."] >"
    " let command_fmt = 'qgrep search ' .g:QGREP_PROJLIST ." H %s || true"
    let command_fmt = 'qgrep search ' .g:QGREP_PROJLIST ." H %s " . g:qgrep_filter
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command, '--prompt', prompt]}
    let spec = fzf#vim#with_preview(spec, 'hidden,right', 'ctrl-/')
    call fzf#vim#grep(initial_command, 0, spec, a:fullscreen)
  endfunction
  command! -nargs=* -bang QGrep call s:qgrepFzf(<q-args>, <bang>0)
]]
vim.keymap.set('n', '<leader>qp', ':QP<CR>', { desc = 'select qgrep project/s' })
vim.keymap.set('n', '<leader>qf', ':QF<CR>', { desc = 'qgrep file list' })
vim.keymap.set('n', '<leader>qg', ':QG ', { desc = 'qgrep fzf' })
vim.keymap.set('n', '<leader>qG', ':QGrep ', { desc = 'qgrep live fzf' })
vim.keymap.set('n', '<leader>qw', ':QGW<CR>', { desc = 'qgrep word under cursor' })

--
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.updatetime = 500

-- Return to last edit position when opening files
vim.cmd [[
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
]]

-- Use RipGrep for grep if available
vim.cmd [[
  if executable('rg')
    set grepprg=rg\ -H\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
  endif
]]

-- toggle quick-fix window -- Stolen from https://github.com/milkypostman/vim-togglelist/blob/master/plugin/togglelist.vim
vim.cmd [[
  let g:toggle_list_copen_command = "copen 30"

  function! s:GetBufferList() 
    redir =>buflist 
    silent! ls! 
    redir END 
    return buflist 
  endfunction

  function! ToggleQuickfixList()
    for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Quickfix List"'), 'str2nr(matchstr(v:val, "\\d\\+"))') 
      if bufwinnr(bufnum) != -1
        cclose
        return
      endif
    endfor
    let winnr = winnr()
    exec(g:toggle_list_copen_command)
    if winnr() != winnr
      wincmd p
    endif
  endfunction
]]
vim.keymap.set('n', '<leader>qq', ':call ToggleQuickfixList()<CR>')
vim.keymap.set('n', '<leader>q.', ':try | cnewer | catch | endtry<CR>')
vim.keymap.set('n', '<leader>q,', ':try | colder | catch | endtry<CR>')
vim.keymap.set('n', '<leader>qh', ':chistory<CR>')

tab_bindings()
return {}
