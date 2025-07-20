vim.pack.add({
  { src = 'https://github.com/karb94/neoscroll.nvim' },           -- Makes scrolling smoooooth

  -- Theme
  { src = 'https://github.com/npezza93/catppuccin.vim', name = 'catppuccin' },

  -- General
  { src = 'https://github.com/tpope/vim-repeat' },                -- Makes dot work with everything
  { src = 'https://github.com/tpope/vim-surround' },              -- Adds surround motion
  { src = 'https://github.com/ggandor/leap.nvim' },               -- Two letter motion
  { src = 'https://github.com/ggandor/flit.nvim' },
  { src = 'https://github.com/christoomey/vim-tmux-navigator' },  -- Makes navigating in tmux and vim easier
  { src = 'https://github.com/chrisbra/csv.vim' },

  -- Git related plugins
  { src = 'https://github.com/nvim-lua/plenary.nvim' },           -- General lua functions for neovim
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },         -- Indicates added, modified and removed lines in a file

  -- Ruby (Tags and such)
  { src = 'https://github.com/npezza93/vim-tags' },               -- Load tag files for ruby and gems
  { src = 'https://github.com/npezza93/vim-rails' },
  { src = 'https://github.com/npezza93/vim-ruby' },               -- Ruby stuff
  { src = 'https://github.com/Wansmer/treesj' },                  -- Toggles ruby blocks. Rewrite with tree sitter

  -- Tree sitter
  { src = 'https://github.com/andymass/vim-matchup' },            -- Enhances % jumping
  { src = 'https://github.com/npezza93/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/AbaoFromCUG/nvim-treesitter-endwise', version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },

  -- Tree view
  { src = 'https://github.com/kyazdani42/nvim-web-devicons' },    -- Adds devicon integration on tree viewer
  { src = 'https://github.com/kyazdani42/nvim-tree.lua' },        -- Adds tree viewer

  -- LSP like features and snippets
  { src = 'https://github.com/npezza93/nvim-lspconfig' },
  { src = 'https://github.com/onsails/lspkind.nvim' },
  { src = 'https://github.com/hrsh7th/nvim-cmp' },
  { src = 'https://github.com/hrsh7th/cmp-path' },
  { src = 'https://github.com/quangnguyen30192/cmp-nvim-tags' },
  { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/saadparwaiz1/cmp_luasnip' },

  -- Searching
  { src = 'https://github.com/mileszs/ack.vim' },                 -- Search across project
  { src = 'https://github.com/npezza93/fozzie.vim' },             -- Fuzzy file searching

  -- cmd line stuff
  { src = 'https://github.com/VonHeikemen/fine-cmdline.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },

  { src = 'https://github.com/supermaven-inc/supermaven-nvim' },
})
