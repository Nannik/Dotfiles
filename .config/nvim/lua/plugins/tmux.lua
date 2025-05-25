return {
  {
    'preservim/vimux',
    init = function()
      vim.keymap.set('n', '<leader>vp', ':VimuxPromptCommand<CR>', {})

      vim.g.VimuxHeight = 200
      vim.g.VimuxOrientation = 'h'
      vim.g.VimuxUseNearest = 3
    end
  },
  {
    'christoomey/vim-tmux-navigator',
    init = function()
      if (vim.fn.exists('$TMUX')) then
        function TmuxOrSplitSwitch(wincmd, tmuxdir)
          local previous_winnr = vim.fn.winnr()
          print(previous_winnr, vim.fn.winnr())
          if (previous_winnr == vim.fn.winnr()) then
            vim.cmd(string.format('call system("tmux select-pane -%s")', tmuxdir))
            vim.cmd('redraw!')
          end
        end

        vim.keymap.set('n', '<C-H>', function() TmuxOrSplitSwitch('h', 'L') end, { silent = false })
        vim.keymap.set('n', '<C-J>', function() TmuxOrSplitSwitch('j', 'D') end, { silent = true })
        vim.keymap.set('n', '<C-K>', function() TmuxOrSplitSwitch('k', 'U') end, { silent = true })
        vim.keymap.set('n', '<C-L>', function() TmuxOrSplitSwitch('l', 'R') end, { silent = false })
      else
        vim.keymap.set('n', '<C-H>', '<C-W><C-H>', {})
        vim.keymap.set('n', '<C-J>', '<C-W><C-J>', {})
        vim.keymap.set('n', '<C-K>', '<C-W><C-K>', {})
        vim.keymap.set('n', '<C-L>', '<C-W><C-L>', {})
      end
    end
  }
}
