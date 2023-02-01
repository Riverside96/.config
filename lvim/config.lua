require 'lspconfig'.clangd.setup {}
vim.fn.setenv("$OPENAI_API_KEY", "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")














lvim.builtin.project.detection_methods = { "lsp", "pattern" }
-----------------------------------------------------------
--cpp tools adaptor definition

--lvim.builtin.dap.on_config_done = function(dap) end
--local dap = require('dap')
--dap.adapters.cppdbg = {
--  id = 'cppdbg',
--  type = 'executable',
--  command = '/home/rory/.config/lvim/debug_stuff/cpptools-linux-aarch64.vsix_FILES/extension/debugAdapters/bin/OpenDebugAD7',
--}
--
--dap.configurations.cpp = {
--  {
--
--    name = "Launch file",
--    type = "cppdbg",
--    request = "launch",
--    program = function()
--      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--
--    end,
--    cwd = '${workspaceFolder}',
--    stopAtEntry = true,
--  },
--  {
--    name = 'Attach to gdbserver :1234',
--    type = 'cppdbg',
--    request = 'launch',
--    MIMode = 'gdb',
--    miDebuggerServerAddress = 'localhost:1234',
--    miDebuggerPath = '/usr/bin/gdb',
--    cwd = '${workspaceFolder}',
--    program = function()
--      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--    end,
--  },
--}

--needs more setup understanding but its a clean start

local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
-- metals_config.init_options.statusBarProvider = "on"

-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Debug settings if you're using nvim-dap
local dap = require("dap")

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
      --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()
end

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})













-----------------------------------------------------------------------------------------------------------
-- CPP DAP configuration

--install codelldb with :MasonInstall codelldb
--onfigure nvim-dap (codelldb)
lvim.builtin.dap.on_config_done = function(dap)
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
      command = "codelldb",
      args = { "--port", "${port}" },

      -- On windows you may have to uncomment this:    -- detached = false,
    },
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return lvim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = true,
    },
  }

  dap.configurations.c = dap.configurations.cpp
end


require("user.keymaps")
require("user.dap-ui")
-----------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------



lvim.plugins = {
  {
    -- {"emilienlemaire/clang-tidy.nvim"},
    
    {"iftheshoefritz/solargraph-rails"}, --rails completion
    {"tpope/vim-rails"},                 --rails functions
    {"mfussenegger/nvim-dap-python"},
    {"dccsillag/magma-nvim", run = ':UpdateRemotePlugins'},
    {'MunifTanjim/nui.nvim'},
     {'jackMort/ChatGPT.nvim'},
     {"rhysd/vim-clang-format"},
      {"cdelledonne/vim-cmake"},
    --{ 'preservim/vim-lexical' },
    --{ 'f3fora/cmp-spell' },
    --{ 'ycm-core/YouCompleteMe' },
    { 'xuhdev/vim-latex-live-preview' },
    { 'lervag/vimtex' },
    -- { 'dense-analysis/ale' },
    { 'p00f/nvim-ts-rainbow' },
    -- { 'puremourning/vimspector' },
    { 'mfussenegger/nvim-lint'},
    --{ "ThePrimeagen/refactoring.nvim" },
    { "Badhi/nvim-treesitter-cpp-tools" },
    { 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } },
    { "fladson/vim-kitty" },
    { "mfussenegger/nvim-jdtls" },
    { "rafi/awesome-vim-colorschemes" },
    { "xiyaowong/nvim-transparent" },
    { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' },
    { "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim" },
    { "ray-x/lsp_signature.nvim" },
    { 'nyngwang/NeoRoot.lua' },
    { 'lewis6991/impatient.nvim' },
    {  'notjedi/nvim-rooter.lua',config = function() require'nvim-rooter'.setup() end },
    --{'Shatur/neovim-cmake'},
    --{'cdelledonne/vim-cmake'},
    { "theHamsta/nvim-dap-virtual-text" },
    { 'leoluz/nvim-dap-go' },
    --{ 'lambdalisue/fern.vim'},
    --  config = function()
    --  require("nvim-dap-virtual-text").setup()
    --  end,
  },
}


require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'My custom launch configuration',
  program = '${file}',
  -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
})




-----------------------------------------------------------------------------------------------------------
local bundles = {}

local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
    "\n"
  )
)
-----------------------------------------------------------------------------------------------------------
-- Preinstalled plugin options


-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
--lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.breadcrumbs.active = true
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.dap.active = true

-----------------------------------------------------------------------------------------------------------
-- Code Runner Setup

require('code_runner').setup({
  -- put here the commands by filetype
  filetype = {
    -- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    java = "cd $dir && cd .. && cd .. && cd .. && cd .. && cd .. && ./gradlew run", 
    --
    python = "python3 -u",
    typescript = "deno run",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
    --cpp = "cd .. && g++ /*.cpp -o run && ./run",
    -- -g make it debuggable?
    --cpp = "cd $dir && g++ *.cpp inc/*.cpp -o -g run && ./run",
    

    --cpp = "cd $dir && g++  *.cpp -o run && ./run",
    -- cpp = "cd - && cd cmake-debug-build && make && ./run",
 
   -- cpp = "cd $dir && cd - && cd cmake-build-debug && make && ./run",
    cpp = "cd $dir && clang++ -fsanitize=address -Wall -Wno-reorder -Wno-unused-private-field -std=c++20 *.cpp -o run && ./run",
    
    -- cpp = "cd $dir && clang++ -fani  -std=c++20 *.cpp -o run && ./run",
    --cpp = "cd $dir && g++  *.cpp inc/*.cpp -g -o run && ./run",
    --cpp = "cd $dir && g++ -fsanitize=address *.cpp inc/*.cpp -g -o run && ./run",
    --cpp = "cd $dir && g++ -fsanitize=address *.cpp -g -o run && ./run",  -- this is one ive been using

    haskell = "cd $dir && ghc *.hs && ./$fileNameWithoutExt",
    -- scala = "cd $dir && scalac *.scala && scala $fileNameWithoutExt",
    --tex ='cd $dir && pdflatex && $fileName',

   scala = "cd $dir && cd ../../../  && sbt --client run",
      -- scala = "cd $dir && cd .. && cd .. && cd .. && echo $PWD",
      -- scala = "cd $dir && cd ../../../ && echo $PWD",
   -- scala = "cd $dir && cd .. && cd .. && cd .. && cd .. && cd .. && ./gradlew run", 
  },
})






-----------------------------------------------------------------------------------------------------------
-- impatient
require('impatient')
-----------------------------------------------------------------------------------------------------------
--vim-latex-live-preview
vim.g.livepreview_previewer = 'zathura'
vim.g.livepreview_cursorhold_recompile = 0

-----------------------------------------------------------------------------------------------------------
--YouCompleteMe
vim.g.ycm_global_ycm_extra_conf = '/home/rory/.config/lvim/YCM/.ycm_extra_conf.py'
vim.g.ycm_confirm_extra_conf = 0

--vim-lexical theosaurus
--vim.g.lexical#dictionary = ['/home/rory/Documents/theosaurus/mobytheosaurus.txt',]



-- Nvim Tree

-- examples for your init.lua
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-----------------------------------------------------------------------------------------------------------
-- Toggle Diagnostics

require 'toggle_lsp_diagnostics'.init()
-----------------------------------------------------------------------------------------------------------
--  Neo Root Setup
--
require('neo-root').setup {
  CUR_MODE = 2 -- 1 for file/buffer mode, 2 for proj-mode
}
-----------------------------------------------------------------------------------------------------------
--  Transparent Setup

require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})


-----------------------------------------------------------------------------------------------------------
require("nvim-dap-virtual-text").setup {
  enabled = true, -- enable this plugin (the default)
  enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  show_stop_reason = true, -- show stop reason when stopped for exceptions
  commented = false, -- prefix virtual text with comment string
  only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
  all_references = false, -- show virtual text on all all references of the variable (not only definitions)
  filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
  -- experimental features:
  virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
  all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
  virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
  -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}


-----------------------------------------------------------------------------------------------------------
-- LSP Signature Plugin Setup

local cfg = {
  debug = false, -- set to true to enable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
  -- default is  ~/.cache/nvim/lsp_signature.log
  verbose = false, -- show debug line number

  bind = true, -- This is mandatory, otherwise border config won't get registered.
  -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
  -- set to 0 if you DO NOT want any API comments be shown
  -- This setting only take effect in insert mode, it does not affect signature help in normal
  -- mode, 10 by default

  max_height = 12, -- max height of signature floating_window
  max_width = 80, -- max_width of signature floating_window
  wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long

  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap

  floating_window_off_x = 1, -- adjust float windows x position.
  floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines

  close_timeout = 4000, -- close floating window after ms when laster parameter is entered
  fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
  hint_scheme = "String",
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  handler_opts = {
    border = "rounded" -- double, rounded, single, shadow, none
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'

  select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
  move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
}

-- recommended:
require 'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

-- You can also do this inside lsp on_attach
-- note: on_attach deprecated
require 'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key


-----------------------------------------------------------------------------------------------------------
-- Parsers

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "cpp",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true



-----------------------------------------------------------------------------------------------------------
--primeagen refactoring BASIC setup

-- require('refactoring').setup({
--   prompt_func_return_type = {
--     go = false,
--     java = false,

--     cpp = false,
--     c = false,
--     h = false,
--     hpp = false,
--     cxx = false,
--   },
--   prompt_func_param_type = {
--     go = false,
--     java = false,

--     cpp = false,
--     c = false,
--     h = false,
--     hpp = false,
--     cxx = false,
--   },
--   printf_statements = {},
--   print_var_statements = {},
-- })














-----------------------------------------------------------------------------------------------------------
-- setup clangd

-- customize clangd by changing the flags below
local clangd_flags = {
  "--background-index",
  "--fallback-style=google",
  "--all-scopes-completion",
  "--clang-tidy",
  "--log=error",
  "--completion-style=detailed",
  "--pch-storage=disk",
  "--folding-ranges",
  "--enable-config",
  "--offset-encoding=utf-16",
}


local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = { "utf-16" }

require("lvim.lsp.manager").setup("clangd", {
  cmd = { "clangd", unpack(clangd_flags) },
  on_attach = require("lvim.lsp").common_on_attach,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = capabilities,
})


-- Theme Settings

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-----------------------------------------------------------------------------------------------------------
-- Manual Lsp stuff


---@usage disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false

---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
local opts = {} -- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("pyright", opts)

require("lvim.lsp.manager").setup("clangd")


vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
---`:LvimInfo` lists which server(s) are skipped for the current filetype
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "emmet_ls"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end


-----------------------------------------------------------------------------------------------------------
-- Formatters

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "google_java_format", filetypes = { "java" } },
}

-----------------------------------------------------------------------------------------------------------
-- Keymaps




lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- file running
lvim.keys.normal_mode["<leader>r"] = ":wa|:RunFile<cr>"
lvim.keys.normal_mode["<leader>rr"] = ":RunClose<cr>"
lvim.keys.normal_mode["<leader>lt"] = ":ToggleDiag<cr>"
-- vim.keymap.set("n", "t", vim.lsp.buf.hover, {buffer=0})
lvim.keys.normal_mode["<leader>t"] = vim.lsp.buf.hover
lvim.keys.normal_mode["<leader>jd"] = vim.lsp.buf.definition
--close any floating windows like the above one
lvim.keys.normal_mode["<leader>tt"] = ":close<cr>"
lvim.keys.visual_mode["<leader>f"] = ":fold<cr>"
lvim.keys.normal_mode["<leader>m"] = ":LLPStartPreview<cr>"


-- local keymap = {
--     S = {':lua require("vim.builtin.dap").set_breakpoint(vim.fn.input('Predicate: '))<CR>'}   
-- }

  lvim.keys.normal_mode["<leader>m"] = ":LLPStartPreview<cr>"


--debugging
lvim.keys.normal_mode["<leader>dp"] = ":lua require'lvim.builtin.dap'.set_breakpoint(lvim.fn.input('Predicate: '))<cr>"


--spellcheck
--toggle spell
lvim.keys.normal_mode["<leader>ts"] = ":set invspell<cr>"
--zg to add to good words
--z= to correct words
--

lvim.keys.normal_mode["<leader>u"] = ":MagmaEvaluateOperator<cr>"
-- nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
-- nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
-- xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
-- nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
-- nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
-- nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>

-- let g:magma_automatically_open_output = v:false
-- let g:magma_image_provider = "ueberzug"









--primeagen refactoring


-----------------------------------------------------------------------------------------------------------
-- nvim-treesitter-cpp-tools

require('nvim-treesitter.configs').setup({
  -- ...
  nt_cpp_tools = {
    enable = true,
    preview = {
      quit = 'q', -- optional keymapping for quit preview
      accept = '<tab>' -- optional keymapping for accept preview
    },
    header_extension = 'h', -- optional
    source_extension = 'cxx', -- optional
    custom_define_class_function_commands = { -- optional
      TSCppImplWrite = {
        output_handle = require 'nvim-treesitter.nt-cpp-tools.output_handlers'.get_add_to_cpp()
      }
      --[[
            <your impl function custom command name> = {
                output_handle = function (str, context) 
                    -- string contains the class implementation
                    -- do whatever you want to do with it
                end
            }
            ]]
    }
  }
})




----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
