return {
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  config = function ()
    require('lualine').setup({
      options = {
        theme = 'dracula',
        icons_enabled = true
        -- component_separators = '|',
        -- section_separators = '', 
      },
    })
  end
}
