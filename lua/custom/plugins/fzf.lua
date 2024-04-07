-- Fuzzy file finder goodness
-- Access Ripgrep with :RG
-- Access FZF with :FZF

return {
  {
    'junegunn/fzf',
    dependencies = { 'junegunn/fzf.vim' },
    config = function()
      vim.cmd [[
          " allow escape to quit FZF windows
          tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

          " Live RipGrep
          function! RipgrepFzf(query, fullscreen)
            let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
            let initial_command = printf(command_fmt, shellescape(a:query))
            let reload_command = printf(command_fmt, '{q}')
            let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
            let spec = fzf#vim#with_preview(spec, 'hidden,right', 'ctrl-/')
            call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
          endfunction
          if executable("rg")
            command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
          endif
        ]]
    end,
  },
}
