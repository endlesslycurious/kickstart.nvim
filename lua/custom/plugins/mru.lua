-- Most Recently Used (MRU) file list
-- :MRU to access then select file
-- :MRU <pattern> then tab to search

return {
  -- MRU command
  'yegappan/mru',
  init = function()
    vim.cmd [[ 
      let MRU_Max_Entries=2048
      let MRU_Use_Current_Window=1
    ]]
  end,
}
