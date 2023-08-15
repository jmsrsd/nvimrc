local import = function(name)
  return require('plugin.lib.' .. name)
end

return {
  -- UIs
  import('color.tokyonight'),
  -- import('color.gruvbox-material'),
  import('nvim-web-devicons'),
  import('nvim-tree'),
  import('lualine'),
  -- import('transparent'),
  import('indent-blankline'),
  import('dressing'),
  import('telescope'),

  -- Git
  import('gitsigns'),
  import('gitblame'),

  -- Parsers
  import('nvim-treesitter'),
  import('nvim-autopairs'),
  import('nvim-ts-autotag'),

  -- Languages
  import('flutter'),
  import('kitty'),

  -- LSP
  import('lsp-zero.base'),
  import('lsp-zero.completion'),
  import('null-ls'),
  import('lsp-zero.lsp'),

  -- TS/JS
  import('prettier'),
  import('eslint'),

  -- Others
  import('which-key'),
  import('fidget'),
  import('comment'),
  import('close-buffers'),
}
