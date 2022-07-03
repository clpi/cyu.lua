local colors = require("cayu.colors")
local hilink = function(name, link) 
  vim.api.nvim_set_hl(0, name, { link = link })
end

local M = {}

M.termcolors = function(c)
    vim.g.terminal_color_0 = c.bg
    vim.g.terminal_color_8 = c.gray

    vim.g.terminal_color_1 = c.lred
    vim.g.terminal_color_9 = c.dred

    vim.g.terminal_color_2 = c.llyellow
    vim.g.terminal_color_10 = c.dyellow

    vim.g.terminal_color_3 = c.lorange
    vim.g.terminal_color_11 = c.dorange

    vim.g.terminal_color_4 = c.lblue
    vim.g.terminal_color_12 = c.dblue

    vim.g.terminal_color_5 = c.lmagenta
    vim.g.terminal_color_13 = c.dmagenta

    vim.g.terminal_color_6 = c.lcyan
    vim.g.terminal_color_14 = c.dcyan

    vim.g.terminal_color_7 = c.white1
    vim.g.terminal_color_15 = c.white2
end

function M.setup(config)
  config = config or require("cayu.config")

  local theme = {}
  theme.config = config
  theme.colors = colors.setup(config)
  local c = theme.colors

  theme.base = {
    Comment = { fg = c.comment, style = config.commentStyle },
    ColorColumn = { bg = c.bg, fg = c.fg_dark },
    Conceal = { fg = c.gray2 },
    Cursor = { fg = c.bg, bg = c.fg_gray },
    lCursor = { fg = c.bg_sel, bg = c.fg_dark },
    CursorIM = { fg = c.bg_lite, bg = c.fg_gray },
    CursorColumn = { bg = c.bg_hi },
    CursorLine = { bg = c.bg_hi },
    Directory = { fg = c.lblue, style = "bold" },
    DiffAdd = { bg = c.diff.add, fg = c.bg },
    DiffChange = { bg = c.diff.change, fg = c.bg },
    DiffDelete = { bg = c.diff.delete, fg = c.bg },
    DiffText = { bg = c.diff.text, fg = c.fg_gray },
    EndOfBuffer = { fg = c.bg },
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.error }, -- error messages on the command line
    VertSplit = { fg = c.bg_darker }, -- the column separating vertically split windows
    Folded = { fg = c.blue, bg = c.fg_gutter }, 
    FoldColumn = { bg = c.bg_darker, fg = c.comment }, 
    SignColumn = { bg = config.transparent and c.none or c.bg_darker, fg = c.fg_gutter }, 
    SignColumnSB = { bg = c.bg_darkest, fg = c.fg_gutter }, -- column where |signs| are displayed
    Substitute = { bg = c.red, fg = c.black }, 
    LineNr = { fg = c.fg_gutter , bg = c.bg_darkest}, 
    LineNrAbove = { fg = c.fg_gutter_light , bg = c.darkest}, 
    LineNrBelow = { fg = c.fg_gutter_light , bg = c.darkest}, 
    MatchParen = { fg = c.yellow, bg=c.bg_hi, style = "bold" },
    CursorLineNr = { fg = c.green, style = "bold", bg = c.darkest },
    ModeMsg = { fg = c.gray2, style = "bold" },
    MsgArea = { fg = c.gray1 },
    MsgSeparator= { fg = c.bg_lite  }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.blue },
    NonText = { fg = c.dark3 },
    Normal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    NormalNC = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar },

    NormalFloat = { fg = c.fg, bg = c.bg_float },
    NvimFloat = { fg = c.lpurple, bg = c.bg_float },
    FloatBorder = { fg = c.gray, bg = c.bg_float },
    FloatTitle = { fg = c.green, style = "bold"},
    FloatShadow = { fg = c.fg_dark, bg = c.black, style = "bold"},
    FloatShadowThrough = { fg = c.gray, bg = c.black, style = "bold"},

    Pmenu = { bg = c.bg_lite, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { fg = c.yellow, style = "bold", bg=c.bg_sel }, -- Popup menu: selected item.
    PmenuSbar = { bg = c.comment }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.bg_lite }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg_hi, fg = c.white1},
    Search = { bg = c.bg_search, fg = c.fg, style="bold"},
    IncSearch = { bg = c.bg_sel, style="italic,bold" }, 

    SpecialKey = { fg = c.dark3 },
    SpellBad = { sp = c.error, style = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.warning, style = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.hint, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.fg_darker, bg = c.black }, -- status line of current window
    StatusLineNC = { fg = c.fg_dark, bg = c.black }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.bg_statusline, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.black, fg = c.bg_hi }, -- tab pages line, where there are no labels
    TabLineSel = { bg = c.bg_hi, fg = c.lgreen }, -- tab pages line, active tab page label
    Title = { fg = c.blue, style = "bold" }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.bg_sel}, -- Visual mode selection
    VisualNOS = { bg = c.bg_visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.warning }, -- warning messages
    Whitespace = { fg = c.fg_gutter }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.yellow, fg = c.bg, }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = c.purple }, -- (preferred) any constant
    String = { fg = c.green }, --   a string constant: "this is a string"
    Character = { fg = c.purple }, --  a character constant: 'c', '\n'
    Number        = { fg = c.lpurple }, --   a number constant: 234, 0xff
    Boolean       = { fg = c.purple, style = "bold"}, --  a boolean constant: TRUE, false
    Float         = {  fg = c.dpurple}, --    a floating point constant: 2.3e10

    Identifier = { fg = c.orange }, -- , style = config.variableStyle }, -- (preferred) any variable name
    Function = { fg = c.yellow }, -- , style = config.functionStyle }, -- function name (also: methods for classes)


    Statement = { fg = c.yellow }, -- (preferred) any statement
    Conditional   = {  fg = c.yellow, style = "italic" }, --  if, then, else, endif, switch, etc.
    Repeat        = { fg = c.orange, style = "italic" }, --   for, do, while, etc.
    Label         = { fg = c.dyellow, style = "italic" }, --    case, default, etc.
    Operator = { fg = c.red, }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.purple}, -- style = config.keywordStyle }, --  any other keyword
    Exception     = { fg=c.red, style = "bold" }, --  try, catch, throw

    PreProc = { fg = c.llyellow , style = "italic"}, -- (preferred) generic Preprocessor
    Include       = { fg = c.llyellow, style = "italic" }, --  preprocessor #include
    Define        = { fg = c.lcyan, style = "bold" }, --   preprocessor #define
    Macro         = { fg = c.lblue, style = "bold"}, --    same as Define
    PreCondit     = { fg = c.llcyan, style = "bold"}, --  preprocessor #if, #else, #endif, etc.

    Type      = { fg = c.orange }, -- (preferred) int, long, char, etc.
    StorageClass  = { fg = c.dorange, style = "italic" }, -- static, register, volatile, etc.
    Structure = { fg = c.yellow , style = "bold"}, --  struct, union, enum, etc.
    Typedef       = { fg = c.red }, --  A typedef

    Special     = { fg = c.llyellow }, -- (preferred) any special symbol
    SpecialChar = { fg = c.llyellow, style = "italic" }, --  special character in a constant
    Tag         = { fg = c.lblue }, --    you can use CTRL-] on this
    Delimiter     = {fg=c.red }, --  character that needs attention
    SpecialComment= { fg=c.lyellow, style="italic"}, -- special things inside a comment
    -- Debug         = { }, --    debugging statements

    Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
    Bold = { style = "bold" },
    Italic = { style = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.dred , style="bold"}, -- (preferred) any erroneous construct
    Todo = { bg = c.none, fg = c.yellow , style="bold"}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Note = { bg = c.none, fg=c.yellow,style="bold"},

    qfLineNr = { fg = c.gray2 },
    qfFileName = { fg = c.purple },

    cString = { fg = c.green, style = "italic" },

    htmlH1 = { fg = c.magenta, style = "bold" },
    htmlH2 = { fg = c.blue, style = "bold" },
    htmlH3 = { fg = c.purple, style = "bold" },
    htmlH4 = { fg = c.red, style = "bold" },
    htmlH5 = { fg = c.orange, style = "bold"},
    htmlH6 = { fg = c.yellow, style = "bold"},

    mkdHeading = { fg = c.orange, style = "bold" },
    mkdCode = { bg = c.bg_darker, fg = c.lteal, style = "italic" },
    mkdCodeDelimiter = { bg = c.bg_dark, fg = c.magenta },
    mkdCodeStart = { fg = c.dmagenta, },
    mkdCodeEnd = { fg = c.ddmagenta, },
    mkdLink = { fg = c.blue, style = "underline" },
    mkdLinkTitle = { fg = c.lblue, style = "bold"},

    jsonTSLabel = { fg = c.dorange },

    markdownIdDeclaration = { fg = c.dpurple, style = "italic"};
    markdownFootnoteDefinition = { fg = c.dmagenta, style = "bold" };

    markdownHeadingDelimiter = { fg = c.orange, style = "bold" },
    -- markdownCode = { fg = c.dteal , style = "italic"},
    markdownCode = { fg = c.lgreen , style = "italic"},
    mkdQuot = { fg = c.gray2, style = "italic", bg = c.bg_sel },
    mkdCode = { fg = c.lgreen , style = "italic"},
    markdownCodeBlock = { fg = c.lteal },
    markdownH1 = { fg = c.magenta, style = "bold" },
    markdownH2 = { fg = c.blue, style = "bold" },
    markdownH3 = { fg = c.purple, style = "bold" },
    markdownH4 = { fg = c.red, style = "bold" },
    markdownH5 = { fg = c.orange, style = "bold"},
    markdownH6 = { fg = c.yellow, style = "bold"},
    markdownLinkText = { fg = c.blue, style = "underline" },
    mkdCodeDelimiter = { fg = c.magent },
    markdownFootnote = { fg = c.cyan },
    markdownRule = { fg = c.dorange, style = "underline"},
    markdownUrl = { fg = c.lblue, style = "underline"},
    markdownValid = { fg = c.hint },
    markdownLink = { fg = c.lblue, style = "underline"},
    markdownLinkTextDelimiter = { fg = c.dpurple };
    markdownId  = { fg = c.lcyan },

    tsxTSConstructor = { fg = c.ddorange, style = "bold,italic"},
    tsxTSTagAttribute = { fg = c.dpurple, style = "italic"},
    typescriptTSConstructor = { fg = c.orange, style = "bold"},
    yamlTSField = { fg = c.cyan2 },
    -- NvimLambda = { fg = c.magenta, style = "bold" },
    -- NvimCurly = { fg = C.operator},-- style = "bold" },


    debugPC = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = c.ddblue,  fg = c.info }, -- used for breakpoint colors in terminal-debug

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.fg_gutter }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.fg_gutter }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.fg_gutter }, -- used for highlighting "write" references

    LspCodeLensSeparator = { fg = c.gray },

    DiagnosticError = { fg = c.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { bg = c.bg_sel,  fg = c.error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = c.bg_sel,  fg = c.warning }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = c.bg_sel,  fg = c.info }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = c.bg_sel,  fg = c.hint }, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { style = "undercurl", sp = c.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { style = "undercurl", sp = c.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { style = "undercurl", sp = c.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { style = "undercurl", sp = c.hint }, -- Used to underline "Hint" diagnostics

    LspSignatureActiveParameter = { fg = c.green, style = "bold" },
    LspCodeLens = { fg = c.comment },

    ALEErrorSign = { fg = c.error },
    ALEWarningSign = { fg = c.warning },
  }

  if not vim.diagnostic then
    local severity_map = {
      Error = "Error",
      Warn = "Warning",
      Info = "Information",
      Hint = "Hint",
    }
    local types = { "Default", "VirtualText", "Underline" }
    for _, type in ipairs(types) do
      for snew, sold in pairs(severity_map) do
        theme.base["LspDiagnostics" .. type .. sold] = {
          link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
        }
      end
    end
  end

  theme.plugins = {

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    TSNote =              { fg = c.orange, style = "bold" };
    TSAnnotation        = { fg=c.comment};    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSAttribute         = { fg=c.lteal, };    -- (unstable) TODO: docs
    TSBoolean         = { fg=c.purple, style = "italic" }; -- For booleans.
    TSCharacter         = { fg=c.magenta};
    TSCharacterSpecial  = { fg = c.lmagenta, style = "italic"};
    TSComment           = { fg=c.comment, style = 'italic'};    -- For comment blocks.

    TSWarning         = { fg = c.warning , style = "bold"},
    TSDanger          = { fg = c.ddred , style = 'bold'},
    TSConstructor     = { fg = c.lyellow },
    TSConditional       = { fg=c.llred, style = "italic"};
    TSConstant          = { fg=c.llpurple};
    TSConstBuiltin      = { fg=c.lmagenta, style = "italic"};
    TSConstMacro        = { fg=c.blue, style="italic,bold" };
    TSDebug           = { fg = c.lcyan };
    TSError           = { fg = c.dred };
    TSException         = {fg=c.red };
    TSField           = { fg = c.lblue };
    TSFloat           = { fg = c.purple };
    TSFuncBuiltin     = { fg = c.dyellow, style = "bold,italic" };
    TSFunction        = { fg = c.yellow, style = "italic" };
    TSFuncMacro       = { fg = c.lyellow, style = "bold"},-- style = "" };
    TSInclude         = { fg = c.yellow, style = "italic" };
    TSKeyword         = { fg = c.orange, style = "bold"};
    TSKeywordFunction = { fg = c.lmagenta, style ="bold"};
    TSKeywordReturn = { fg = c.orange, style = "bold,italic"};
    TSKeywordOperator = { fg = c.red, style = "italic"};
    TSLabel           = { fg = c.purple, style = 'italic' },
    TSEnvironment     = { fg = c.magenta },
    TSEnvironmentName = { fg = c.lmagenta, style = "italic" },
    TSMath            = { fg = c.teal, tyle = "italic" },

    TSMethod            = { fg=c.llorange, style="italic"},
    TSNamespace         = { fg = c.lpurple},
    TSNone              = { fg = c.fg_dark, };    
    TSNumber            = { fg=c.purple}; 
    TSOperator        = { fg = c.lred },
    TSParameter       = { fg = c.dorange }, -- For parameters of a function.
    TSParameterReference= { fg=c.dorange, style="italic"};    -- For references to parameters of a function.
    TSProperty        = { fg = c.lllblue , style="italic"}, -- Same as `TSField`.
    TSPunctDelimiter  = { fg = c.red },
    TSPunctBracket    = { fg = c.dred, },
    TSPunctSpecial    = { fg = c.ddorange },
    TSRepeat            = { fg=c.orange, style="italic"};    -- For keywords related to loops.
    TSString          = { fg = c.lgreen, style = "italic" }; -- For strings.
    cTSString         =  { fg = c.lgreen, style = "italic" }; -- For strings.
    cTSStringEscape   =  { fg = c.yellow, style = "italic"},
    cppRawString      = { fg = c.yellow, style = "italic"},
    TSStringRegex     = { fg = c.teal }, -- For regexes.
    TSStringEscape    = { fg = c.orange }, -- For escape characters within a string.
    TSStringSpecial   = { fg = c.yellow, style = 'italic'};
    TSSymbol          = { fg = c.llcyan, style = "bold,italic" }; -- For identifiers referring to symbols or atoms.
    TSPreProc = { fg = c.llyellow, style = "italic"};
    TSDefine = { fg = c.dorange, style = "bold"};

    TSStorageClass = { fg = c.llcyan };

    TSType            = { fg = c.lblue,};
    TSTypeBuiltin     = { fg = c.cyan,style="italic" };
    TSTypeQualifier   = { fg = c.llpurple, style = "italic" };
    TSTypeDefinition  = { fg = c.lblue, style = "bold"};
    TSDefinitionUsage = { fg = c.teal, style = "italic"};
    TSCurrentScope    = { fg = c.llyellow, style = "italic"};

    TSVariable        = { fg = c.cyan }; --, style = "italic"};
    TSVariableBuiltin = { fg = c.teal , style = "italic"}, -- Variable names that are defined by the languages, like `this` or `self`.
     

    TSTag           = { fg = c.llcyan }; -- Tags like html tag names.
    TSTagAttribute  = { fg = c.teal, style = "italic" }; -- Tags like html tag names.
    TSTagDelimiter  = { fg = c.red }; -- Tag delimiter like `<` `>` `/`
    TSText              = {  fg = c.fg },
    TSTitle             = {  fg = c.lblue },
    TSTextReference = { fg = c.teal, style ="italic" },
    TSEmphasis          = { style = "italic,bold"};    -- For text to be represented with emphasis.
    TSUnderline         = { style = "underline" };    -- For text to be represented with an underline.
    TSStrike            = { style = "strikethrough" };    -- For strikethrough text.

    TSLiteral           = { fg = c.teal };    -- Literal text.
    TSURI               = { fg=c.lblue, style="underline"};    -- Any URI like a link or email.

    -- BQF
    PreviewBorder       = { fg = c.gray };
    BqfPreviewRange     = { bg = c.bg_search, style = "bold" };


    NotifyERRORBorder= { fg = c.red },
    NotifyWARNBorder= { fg = c.yellow },
    NotifyINFOBorder={ fg = c.green },
    NotifyDEBUGBorder={ fg = c.bg_sel },
    NotifyTRACEBorder={ fg = c.purple },

    NotifyERRORIcon={ fg = c.red },
    NotifyWARNIcon={ fg = c.yellow },
    NotifyINFOIcon={ fg = c.green },
    NotifyDEBUGIcon={ fg = c.grey },
    NotifyTRACEIcon={ fg = c.purple },

    NotifyERRORTitle= { fg = c.red },
    NotifyWARNTitle={ fg = c.yellow },
    NotifyINFOTitle={ fg = c.green },
    NotifyDEBUGTitle={ fg = c.grey },
    NotifyTRACETitle={ fg = c.purple },

    -----
    rainbowcol1=  { fg = c.red },
    rainbowcol2=  { fg = c.orange },
    rainbowcol3=  { fg = c.yellow },
    rainbowcol4=  { fg = c.green },
    rainbowcol5=  { fg = c.blue },
    rainbowcol6=  { fg = c.purple },
    rainbowcol7=  { fg = c.green },



    VimwikiH1Folding = { fg = c.lyellow, bg=c.none, style = "italic" };
    VimwikiH2Folding = { fg = c.lgreen, bg=c.none, style = "italic" };
    VimwikiH3Folding = { fg = c.lcyan, bg=c.none, style = "italic" };
    VimwikiH4Folding = { fg = c.lpurple, bg=c.none, style = "italic" };
    VimwikiH5Folding = { fg = c.lred, bg=c.none, style = "italic" };
    VimwikiH6Folding = { fg = c.lorange, bg=c.none, style = "italic" };
    VimwikiHeader1 = { fg = c.yellow, bg=c.none, style = "bold" };
    VimwikiHeader2 = { fg = c.green, bg=c.none, style = "bold" };
    VimwikiHeader3 = { fg = c.cyan, bg=c.none, style = "bold" };
    VimwikiHeader4 = { fg = c.purple, bg=c.none, style = "bold" };
    VimwikiHeader5 = { fg = c.red, bg=c.none, style = "bold" };
    VimwikiHeader6 = { fg = c.orange, bg=c.none, style = "bold" };

    Vimwikipurple  = { fg = c.purple, bg = c.none };
    Vimwikibpurple  = { fg = c.lpurple , bg=c.none};

    Vimwikiblue  = { fg = c.blue, bg = c.none };
    Vimwikibblue  = { fg = c.lblue , bg = c.none };

    Vimwikiyellow  = { fg = c.yellow , bg = c.none};
    Vimwikibyellow  = { fg = c.lyellow , bg = c.none };

    Vimwikigreen   = { fg = c.green, bg = c.none };
    Vimwikibgreen   = { fg = c.lgreen , bg = c.none};

    Vimwikiorange  = { fg = c.orange, bg = c.none};
    Vimwikiborange  = { fg = c.lorange, bg = c.none};

    Vimwikired     = { fg = c.red , bg = c.none  };
    Vimwikibred     = { fg = c.lred   , bg = c.none};
    -- VimwikiTag     = { fg = c.magenta , style = "bold"};
    VimwikiTag     = { fg = c.lred , style = "bold"};
    Vimwikigray    = { fg=c.gray2, bg = c.none};
    Vimwikibgray    = { fg=c.comment, bg = c.none};
    VimwikiCode    = { fg=c.lgreen };
    VimwikiCodeT   = { fg = c.lpurple , style = "italic"};
    VimwikiMath    = { fg = c.lcyan };
    VimwikiMathT   = { fg = c.llyellow };
    VimwikiHTMLTag    = { fg = c.dred };
    VimwikiBoldChar   = { fg = c.lblue, style = "bold"};
    VimwikiBoldCharT   = { fg = c.blue, style = "bold"};
    VimwikiPre   = { fg = c.magenta };
    VimwikiPreT   = { fg = c.magenta };
    VimwikiList    = { fg = c.orange };
    VimwikiTodo   =  { fg = c.blue };
    VimwikiHR     = { fg = c.yellow };
    VimwikiEqIn    = { fg = c.red} ;
    VimwikiEqInT   = { fg = c.lred } ;
    VimwikiError   = { fg = c.dred, style = "bold"};
    VimwikiEmoji = { fg = c.yellow};
    VimwikiDelimiterColor = { fg = c.dred };
    VimwikiCellSeparator = { fg = c.red };
    VimwikiCheckBoxDone = { fg = c.gray, style = "italic"};
    VimwikiPlaceholder = { fg = c.fg_gutter_light };
    VimwikiMarkers = { fg = c.magenta };
    VimwikiImageChar = { fg = c.lpurple };
    VimwikiTableRow = { fg = c.lblue, };
    VimwikiEqInChar = { fg = c.magenta };
    VimwikiCodeChar = { fg = c.ddmagenta };
    VimwikiCodeCharT = { fg = c.lpurple };
    VimwikiDelimiter = { fg = c.dred };
    VimwikiEqInCharT = { fg = c.lmagenta };
    VimwikiListTodo = { fg = c.dred, };
    VimwikiPreDelim = { fg = c.dmagenta, };
    VimwikiHeaderChar = { fg = c.dorange, style = "bold"};
    VimwikiHeaderCharT = { fg = c.ddorange, style = "italic,bold"};

    VimwikiLink =    { fg = c.lblue, style = "underline"};
    VimwikiLinkT   = { fg = c.blue, style = "underline"};

    -- LINKS
    VimwikiLinkRest = { fg = c.lblue, style = "underline" };
    VimwikiLinkChar = { fg = c.dblue, style = "underline" };

    VimwikiImage   = { fg = c.cyan, style = "underline" };
    VimwikiImageT  = { fg = c.lcyan, style = "underline"};

    VimwikiWeblink1  = { fg = c.dcyan, style = "underline" };
    VimwikiWeblink1T  = { fg = c.lyan, style = "italic,underline" };

    VimwikiLinkCharT = { fg = c.lblue  };

    VimwikiWikiLink1 = { fg = c.dblue, style = "underline"};
    VimwikiWikiLink1T = { fg = c.lblue, style = "underline"};

    VimwikiWikiLink1Char = { fg = c.lblue, style = "bold"};
    VimwikiWeblink1Char = { fg = c.lcyan, style = "bold"};

    VimwikiNoExistsLink  = { fg= c.dpurple, style = "italic,underline"};
    VimwikiNoExistsLinkT = { fg = c.dblue, style = "italic,underline"};
    VimwikiNoExistsLinkCharT  = { fg= c.dblue, style = "italic"};


    CopilotSuggestion = { fg = c.fg_gutter_light  };

    IndentBlankline = { fg = c.fg_gutter, bg = c.none };
    IndentBlanklineChar = { fg = c.fg_gutter_light, bg = c.none };
    IndentBlanklineContextChar = { fg = c.yellow, bg = c.none , style = "bold"};
    IndentBlanklineContextStart = { style = "underline"},


    -- Lua
    -- Vimwiki

    -- LspTrouble
    LspTroubleText = { fg = c.fg_dark },
    LspTroubleCount = { fg = c.lmagenta, bg = c.fg_gutter },
    LspTroubleNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },

    TroubleSignOther = { fg = c.purple, style = "bold"},
    TroubleSignError = { fg = c.error, style = "bold"},
    TroubleSignWarning = { fg = c.warning, style = "bold"},
    TroubleSignHint = { fg = c.hint, style = "bold"},
    TroubleSignInformation = { fg = c.info, style = "bold"},

    TroubleTextHint = { fg = c.hint, style = "italic" },
    TroubleTextWarning = { fg = c.yellow, style = "italic" },
    TroubleTextInformation = { fg = c.info, style = "italic" },
    TroubleWarning = { fg = c.yellow, style = "italic" },
    TroubleTextError = { fg = c.error, style = "italic" },


    -- Illuminate
    illuminatedWord = { bg = c.fg_gutter },
    illuminatedCurWord = { bg = c.fg_gutter },

    -- diff

    diffAdded = { fg = c.git.add },
    diffRemoved = { fg = c.git.delete },
    diffChanged = { fg = c.git.change },
    diffOldFile = { fg = c.yellow },
    diffNewFile = { fg = c.orange },
    diffFile = { fg = c.blue },
    diffLine = { fg = c.comment },
    diffIndexLine = { fg = c.magenta },

    FidgetTask = { fg = c.comment };
    FidgetTitle = { fg = c.green,  };

    yamlTSField = { fg = c.lpurple, style = "italic"},


    -- Neogit
    NeogitBranch = { fg = c.magenta },
    NeogitRemote = { fg = c.purple },
    NeogitHunkHeader = { bg = c.bg_hi, fg = c.fg },
    NeogitHunkHeaderHighlight = { bg = c.fg_gutter, fg = c.blue },
    NeogitDiffContextHighlight = { bg = c.bg_darker,fg = c.fg_dark },
    NeogitDiffDeleteHighlight = { fg = c.git.delete, bg = c.diff.delete },
    NeogitDiffAddHighlight = { fg = c.git.add, bg = c.diff.add },

    -- GitGutter
    GitGutterAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeTitle = { fg = c.lorange };
    TelescopeBorder = { fg = c.bg_sel, bg = c.none },
    TelescopeNormal = { fg = c.fg_gray, bg = c.bg_float },
    TelescopePreviewMatch = { c = c.lpurple, bg = c.bg_sel, style = "bold" },

    TelescopePromptNormal = { fg = c.fg_gray, bg = c.black },
    TelescopePromptPrefix = { fg = c.green, bg = c.black, style = "bold" },
    TelescopeResultsStruct = { fg = c.lyellow, };
    TelescopeResultsTitle = { fg = c.lcyan, };
    TelescopePromptTitle = { fg = c.green, bg = c.bg },
    TelescopeSelectionCaret = { fg = c.green, style = "bold" },
    TelescopePromptCounter = { fg = c.green },
    TelescopePromptBorder = { fg = c.bg_sel },
    TelescopeSelection = { fg = c.white1, bg = c.bg_sel },
    TelescopeMatching = { fg = c.orange, style = "bold" },
    TelescopePreviewTitle = { fg = c.lyellow, bg = c.bg },
    TelescopeResultMethod = { fg = c.lblue, bg = c.bg },
    TelescopeResultsLineNr = { fg = c.gray1, bg = c.bg_lite};
    TelescopeResultMethod = { fg = c.lorange, bg = c.bg },
    TelescopeResultsNormal = { fg = c.fg_dark, bg = c.bg },
    TelescopeResultsFileIcon = { fg = c.lblue, style = "bold"};
    TelescopePreviewLink = { fg = c.lblue, style = "underline"};

    -- NvimTree
    NvimTreeNormal = { fg = c.fg_gray, bg = c.darkest },
    NvimTreeSignColumn = { fg = c.gray, bg=c.black},
    NvimTreeStatusLine = { fg = c.bg_lite, bg = c.black };
    NvimTreeStatusLineNC = { fg = c.darkest, bg = c.black };
    NvimTreeWindowPicker = { bg=c.bg_sel},
    NvimTreeOpenedFolderName = { fg = c.lgreen, style="bold", },
    NvimTreeEmptyFolderName = { fg = c.dyellow, style="italic"},
    NvimTreeNormalNC = { fg = c.fg_sidebar, bg = c.darkest },
    NvimTreeRootFolder = { fg = c.green, style = "bold" },
    NvimTreeGitDirty = { fg = c.git.change },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeSpecialFile = { fg = c.purple, style = "italic" },
    NvimTreeIndentMarker = { fg = c.gray },
    NvimTreeImageFile = { fg = c.fg_sidebar },
    NvimTreeSymlink = { fg = c.lpurple , style = "italic"},
    NvimTreeVertSplit = { fg = c.bg_sel },
    NvimTreeCursorLine = { bg = c.bg_hi},
    NvimTreeFolderName = { fg = c.yellow},--, style = "bold" },
    NvimTreeFolderIcon = { fg = c.orange, style = "bold"},
    NvimTreeFileIcon = { fg = c.blue, style = "bold"},

    -- NvimTreeFolderName = { fg = c.purple},--, style = "bold" },

    -- Fern
    FernBranchText = { fg = c.blue },

    -- glyph palette
    GlyphPalette1 = { fg = c.red1 },
    GlyphPalette2 = { fg = c.green },
    GlyphPalette3 = { fg = c.yellow },
    GlyphPalette4 = { fg = c.blue },
    GlyphPalette6 = { fg = c.green1 },
    GlyphPalette7 = { fg = c.fg },
    GlyphPalette9 = { fg = c.red },

    -- Dashboard
    DashboardShortCut = { fg = c.cyan },
    DashboardHeader = { fg = c.blue },
    DashboardCenter = { fg = c.magenta },
    DashboardFooter = { fg = c.yellow, style = "italic" },

    -- WhichKey
    WhichKey = { fg = c.cyan },
    WhichKeyGroup = { fg = c.orange, style = "bold" },
    WhichKeyDesc = { fg = c.fg },
    WhichKeySeperator = { fg = c.comment },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyFloat = { bg = c.bg_sidebar },
    WhichKeyValue = { fg = c.blue },

    -- LspSaga
    DiagnosticWarning = { link = "DiagnosticWarn" },
    DiagnosticInformation = { link = "DiagnosticInfo" },

    LspFloatWinNormal = { fg = c.fg_gray , bg = c.bg_darker },
    LspFloatWinBorder = { fg = c.bg_sel },
    LspSagaBorderTitle = { fg = c.lcyan},
    LspSagaLightBulb = { fg = c.lcyan, },
    LspSagaDiagnosticTruncateLine = { fg = c.bg_lite };
    LspSagaHoverBorder = { fg = c.bg_sel },
    LspSagaRenameBorder = { fg = c.bg_sel },
    NotifyDEBUGBrder = { fg = c.bg_sel },
    LspSagaDefPreviewBorder = { fg = c.bg_sel },
    LspSagaCodeActionBorder = { fg = c.bg_sel },
    LspSagaFinderSelection = { fg = c.dyellow, style = "bold" },
    LspSagaCodeActionTitle = { fg = c.lorange },
    LspSagaCodeActionContent = { fg = c.fg_dark },
    LspSagaDiagnosticBorder = { fg = c.bg_sel },
    LspSagaLspFinderBorder = { fg = c.bg_sel },
    LspSagaSignatureHelpBorder = { fg = c.bg_sel },
    -- LspagaLightbulb = { } ,
    ReferencesCount = { fg = c.purple },
    DefinitionCount = { fg = c.purple },
    DefinitionIcon = { fg = c.blue },
    ReferencesIcon = { fg = c.blue },
    TargetWord = { fg = c.cyan },

    -- NeoVim
    healthError = { fg = c.error },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.warning },


    AerialLine = {bg = c.bg_sel, style = "bold" },
    AerialInterface = { fg = c.cyan },
    AerialLineNr = { fg = c.fg_gutter },
    AerialStruct = { fg = c.dorange, style = "bold"},
    AerialNull = { fg = c.purple },
    AerialEvent = { fg = c.lmagenta },
    AerialOperator = { fg = c.red },
    AerialNumber= { fg = c.dpurple},
    AerialNamespace= { fg = c.dpurple},
    AerialModule= { fg = c.dyellow},
    AerialPackage= { fg = c.lorange},
    AerialString= { fg = c.lgreen, style = "italic"},
    AerialObject= { fg = c.lmagenta},
    AerialFunction = { fg = c.yellow},
    AerialConstant = { fg = c.lpurple},
    AerialField = { fg = c.blue},
    AerialEnum = { fg = c.dorange},
    AerialEnumMember = { fg = c.lorange},
    AerialBoolean = { fg = c.purple},
    AerialClass = { fg = c.yellow, style = "bold"},
    AerialMethod = { fg = c.lred},
    AerialVariable= { fg = c.lpurple},
    AerialProperty= { fg = c.lblue},
    AerialTypeParameter= { fg = c.lcyan},
    AerialKey= { fg = c.red},
    AerialFile = { fg = c.dorange  },
    AerialArray = { fg=c.dcyan},
    AerialConstructor = { fg  = c.teal };

    -- BufferLine
    BufferLinePick  = { fg = c.yellow, style = "bold"};
    BufferLinePickVisible  = { fg = c.imagneta, style = "bold"};
    BufferLineModified = { fg = c.green };
    BufferLineHintDiagnostic = { fg = c.dcyan };
    BufferLineInfoDiagnostic = { fg = c.blue };
    BufferLineError = { fg = c.red },
    BufferLineInfo = { fg=c.blue },
    BufferLineWarning = { fg=c.yellow },
    BufferLineErrorSelected = { fg = c.dred, style = "bold" };
    BufferLineFill = { bg = c.bg_darker },
    BufferLineBufferSelected = { fg = c.lgreen};
    BufferLineBuffer = { fg = c.gray };
    BufferLineTabSelected = { fg = c.orange, style = "bold"};
    BufferLineWarningSelected = { fg = c.yellow, style = "bold"};
    BufferLineNumbersSelected = { fg = c.green, bg = c.bg_hi, style = "bold"};
    BufferLineIndicatorSelected = { fg = c.lgreen, bg = c.none, style = "bold"};

    -- Barbar
    BufferCurrent = { bg = c.fg_gutter, fg = c.fg },
    BufferCurrentIndex = { bg = c.fg_gutter, fg = c.info },
    BufferCurrentMod = { bg = c.fg_gutter, fg = c.warning },
    BufferCurrentSign = { bg = c.fg_gutter, fg = c.info },
    BufferCurrentTarget = { bg = c.fg_gutter, fg = c.red },
    BufferVisible = { bg = c.bg_statusline, fg = c.fg },
    BufferVisibleIndex = { bg = c.bg_statusline, fg = c.info },
    BufferVisibleMod = { bg = c.bg_statusline, fg = c.warning },
    BufferVisibleSign = { bg = c.bg_statusline, fg = c.info },
    BufferVisibleTarget = { bg = c.bg_statusline, fg = c.red },
    BufferInactive = { bg = c.bg_statusline, fg = c.gray2 },
    BufferInactiveIndex = { bg = c.bg_statusline, fg = c.gray2 },
    BufferInactiveMod = { bg = c.bg_statusline, fg = c.ddorange,},
    BufferInactiveSign = { bg = c.bg_statusline, fg = c.border_highlight },
    BufferInactiveTarget = { bg = c.bg_statusline, fg = c.red },
    BufferTabpages = { bg = c.bg_statusline, fg = c.none },
    BufferTabpage = { bg = c.bg_statusline, fg = c.border_highlight },

    -- Sneak
    Sneak = { fg = c.bg_hi, bg = c.magenta },
    SneakScope = { bg = c.bg_visual },

    -- Hop
    HopNextKey = { fg = c.magenta, style = "bold" },
    HopNextKey1 = { fg = c.dblue, style = "bold" },
    HopNextKey2 = { fg = c.ddblue, style = "bold" },
    HopUnmatched = { fg = c.dark3 },

    LightspeedGreyWash = { fg = c.fg_dark },
    -- LightspeedCursor = { link = "Cursor" },
    LightspeedLabel = { fg = c.lmagenta, style = "bold,underline" },
    LightspeedLabelDistant = { fg = c.lgreen, style = "bold,underline" },
    LightspeedLabelDistantOverlapped = { fg = c.green2, style = "underline" },
    LightspeedLabelOverlapped = { fg = c.lmagenta, style = "underline" },
    LightspeedMaskedChar = { fg = c.orange },
    LightspeedOneCharMatch = { bg = c.lmagenta, fg = c.fg, style = "bold" },
    LightspeedPendingOpArea = { bg = c.lmagenta, fg = c.fg },
    LightspeedShortcut = { bg = c.lmagenta, fg = c.fg, style = "bold,underline" },
    -- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
    -- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
    LightspeedUnlabeledMatch = { fg = c.blue2, style = "bold" },

    -- Cmp
    CmpDocumentation = { fg = c.fg_dark, bg = c.none },
    CmpDocumentationBorder = { fg = c.bg_sel, bg = c.bg_float },

    CmpItemAbbr = { fg = c.fg_gray},
    CmpItemAbbrDefault = { fg = c.fg_gray}, --, style="bold"},
    CmpItemKind = { style = "bold", bg = c.black },
    CmpItemKindDefault = { fg = c.lblue, bg = c.none}, --style="bold" },
    CmpItemKindColor = { fg = c.magenta,  },
    cmpItemKindDefault = { fg = c.fg, bg = c.none },
    CmpItemKindFileDefault = { fg = c.yellow}, --, style="bold"},
    CmpItemAbbrDeprecated = { fg = c.fg_dark, bg = c.none, style="strikethrough"},-- style = "strikethrough" },

    CmpItemMenu = { fg = c.fg_darkest},
    CmpItemMenuDefault = { fg = c.fg_darkest},

    CmpItemKindFile = { fg = c.yellow, bg = c.none },-- style="bold"},
    CmpItemKindFolder = { fg = c.blue, bg = c.none}, --style="bold"},
    CmpItemKindKeyword = { fg = c.orange, bg = c.none},-- style="bold"},
    CmpItemKindKeywordVariable = { fg = c.purple, bg = c.none }, --style="bold"},
    CmpItemAbbrMatch = { fg = c.orange, bg = c.none, style = "bold" },--style = "bold"},-- style = "bold" },
    CmpItemAbbrMatchFuzzy = { fg = c.yellow, bg=c.none, style = "bold,italic"},--style = "bold" },

    CmpItemKindVariable = { fg = c.blue, bg = c.none },
    CmpItemKindConstant = { fg = c.dpurple, bg = c.none },
    CmpItemKindReference = { fg = c.lmagenta, bg = c.none },
    CmpItemKindValue = { fg = c.teal, bg = c.none },

    CmpItemKindFunction = { fg = c.lblue, bg = c.none },
    CmpItemKindMethod = { fg = c.red, bg = c.none},-- style = "bold" },
    CmpItemKindConstructor = { fg = c.blue, bg = c.none}, --style = "bold" },

    CmpItemKindClass = { fg = c.lorange, bg = c.none},--, style = "bold" },
    CmpItemKindInterface = { fg = c.yellow, bg = c.none},--, style = "bold" },
    CmpItemKindStruct = { fg = c.orange, bg = c.none},--, style = "bold" },
    CmpItemKindEvent = { fg = c.red, bg = c.none},--, style = "bold" },
    CmpItemKindEnum = { fg = c.purple, bg = c.none},--, style = "bold" },
    CmpItemKindUnit = { fg = c.magenta, bg = c.none},--, style = "bold" },

    CmpItemKindModule = { fg = c.yellow, bg = c.none},--, style = "bold" },
    CmpItemKindText = { fg = c.teal, bg=c.none},--, style = "bold" },

    CmpItemKindProperty = { fg = c.dblue, bg = c.none},--, style = "bold" },
    CmpItemKindField = { fg = c.lblue, bg = c.none},-- style = "bold" },
    CmpItemKindTypeParameter = { fg = c.lpurple, bg = c.none},-- style = "bold"},
    CmpItemKindEnumMember = { fg = c.dorange, bg = c.none}, --style = "bold"},
    CmpItemKindOperator = { fg = c.red, bg = c.none}, --style = "bold"},
    CmpItemKindSnippet = { fg = c.purple, bg = c.none}, --style = "bold" },

    SearchBoxMatch = { bg=c.bg_sel, style = "bold" },

    cppTSProperty = { fg = c.llyellow, style = "italic" },
    bashTSFuncBuiltin = { fg = c.dorange, style = "italic,bold" },
    bashTSParameter = { fg = c.dpurple, style = "italic" },

    luaTSConstructor = { fg = c.magenta, style = "bold"},
    luaTSOperator = { fg = c.red, style = "bold"},
    luaTSParameter = { fg = c.lblue},
    luaTSConstant = { fg = c.lpurple},

    cssCustomProp = { fg = c.purple },
    cssTransformProp = { fg = c.red},
    cssAnimationProp = { fg = c.magenta},

  }


------ LATEX ------
-- vim.api.nvim_set_hl(0, 'latexTSComment', {})
-- vim.api.nvim_set_hl(0, 'latexTSEmphasis', {})
-- vim.api.nvim_set_hl(0, 'latexTSEnvironment', {})
-- vim.api.nvim_set_hl(0, 'latexTSEnvironmentName', {})
-- vim.api.nvim_set_hl(0, 'latexTSFuncMacro', {})
-- vim.api.nvim_set_hl(0, 'latexTSFunction', {})
-- vim.api.nvim_set_hl(0, 'latexTSInclude', {})
-- vim.api.nvim_set_hl(0, 'latexTSMath', {})
-- vim.api.nvim_set_hl(0, 'latexTSNamespace', {})
-- vim.api.nvim_set_hl(0, 'latexTSOperator', {})
-- vim.api.nvim_set_hl(0, 'latexTSParameter', {})
-- vim.api.nvim_set_hl(0, 'latexTSPunctBracket', {})
-- vim.api.nvim_set_hl(0, 'latexTSPunctSpecial', {})
-- vim.api.nvim_set_hl(0, 'latexTSString', {})
-- vim.api.nvim_set_hl(0, 'latexTSStringRegex', {})
-- vim.api.nvim_set_hl(0, 'latexTSTextReference', {})
-- vim.api.nvim_set_hl(0, 'latexTSTitle', {})

------ LUA ------
-- vim.api.nvim_set_hl(0, 'LuaTSBoolean', {})
-- vim.api.nvim_set_hl(0, 'LuaTSComment', {})
-- vim.api.nvim_set_hl(0, 'luaTSConditional', {})
-- vim.api.nvim_set_hl(0, 'luaTSConstructor', {})
-- vim.api.nvim_set_hl(0, 'luaTSField', {})
-- vim.api.nvim_set_hl(0, 'luaTSFunction', {})
-- vim.api.nvim_set_hl(0, 'luaTSFuncBuiltin', {})
-- vim.api.nvim_set_hl(0, 'LuaTSKeyword', {})
-- vim.api.nvim_set_hl(0, 'luaTSKeywordFunction', {})
-- vim.api.nvim_set_hl(0, 'luaTSMethod', {})
-- vim.api.nvim_set_hl(0, 'luaTSNumber', {})
-- vim.api.nvim_set_hl(0, 'luaTSOperator', {})
-- vim.api.nvim_set_hl(0, 'luaTSParameter', {})
-- vim.api.nvim_set_hl(0, 'luaTSPunctBracket', {})
-- vim.api.nvim_set_hl(0, 'luaTSPunctDelimiter', {})
-- vim.api.nvim_set_hl(0, 'luaTSString', {})
-- vim.api.nvim_set_hl(0, 'LuaTSVariable', {})

------ NEORG ------
-- vim.api.nvim_set_hl(0, 'NeorgCodeBlock', {})
-- vim.api.nvim_set_hl(0, 'NeorgLinkLocationURL', {})

------ PYTHON ------
-- vim.api.nvim_set_hl(0, 'pythonTSBoolean', {})
-- vim.api.nvim_set_hl(0, 'pythonTSComment', {})
-- vim.api.nvim_set_hl(0, 'pythonTSConditional', {})
-- vim.api.nvim_set_hl(0, 'pythonTSConstant', {})
-- vim.api.nvim_set_hl(0, 'pythonTSConstBuiltin', {})
-- vim.api.nvim_set_hl(0, 'pythonTSConstructor', {})
-- vim.api.nvim_set_hl(0, 'pythonTSField', {})
-- vim.api.nvim_set_hl(0, 'pythonTSFuncBuiltin', {})
-- vim.api.nvim_set_hl(0, 'pythonTSFunction', {})
-- vim.api.nvim_set_hl(0, 'pythonTSInclude', {})
-- vim.api.nvim_set_hl(0, 'pythonTSKeyword', {})
-- vim.api.nvim_set_hl(0, 'pythonTSKeywordFunction', {})
-- vim.api.nvim_set_hl(0, 'pythonTSKeywordOperator', {})
-- vim.api.nvim_set_hl(0, 'pythonTSKeywordReturn', {})
-- vim.api.nvim_set_hl(0, 'pythonTSMethod', {})
-- vim.api.nvim_set_hl(0, 'pythonTSNumber', {})
-- vim.api.nvim_set_hl(0, 'pythonTSOperator', {})
-- vim.api.nvim_set_hl(0, 'pythonTSParameter', {})
-- vim.api.nvim_set_hl(0, 'pythonTSPunctBracket', {})
-- vim.api.nvim_set_hl(0, 'pythonTSPunctDelimiter', {})
-- vim.api.nvim_set_hl(0, 'pythonTSRepeat', {})
-- vim.api.nvim_set_hl(0, 'pythonTSString', {})
-- vim.api.nvim_set_hl(0, 'pythonTSStringEscape', {})
-- vim.api.nvim_set_hl(0, 'pythonTSType', {})
-- vim.api.nvim_set_hl(0, 'pythonTSTypeBuiltin', {})
-- vim.api.nvim_set_hl(0, 'pythonTSVariable', {})
-- vim.api.nvim_set_hl(0, 'pythonTSVariableBuiltin', {})
  theme.defer = {}
  -- hilink('AerialArrayIcon', 'Constant')
  -- hilink('AerialBooleanIcon', 'Boolean')
  -- hilink('AerialClassIcon', 'Type')
  -- hilink('AerialConstantIcon', 'Constant')
  -- hilink('AerialConstructorIcon', 'TSConstructor')
  -- hilink('AerialEnumIcon', 'Type')
  -- hilink('AerialEnumMemberIcon','TSField')
  -- hilink('AerialEventIcon', 'Type')
  -- hilink('AerialFieldIcon', 'String')
  -- hilink('AerialFileIcon', 'Include')
  -- hilink('AerialFunctionIcon', 'Function')
  -- hilink('AerialInterfaceIcon', 'Type')
  -- hilink('AerialKeyIcon', 'Type')
  -- hilink('AerialMethodIcon', 'TSMethod')
  -- hilink('AerialModuleIcon', 'Include')
  -- hilink('AerialNamespaceIcon', 'TSNamespace')
  -- hilink('AerialNullIcon', 'Type')
  -- hilink('AerialNumberIcon', 'Number')
  -- hilink('AerialObjectIcon', 'TSField')
  -- hilink('AerialOperatorIcon', 'TSConstructor')
  -- hilink('AerialPackageIcon', 'Include')
  -- hilink('AerialPropertyIcon', 'TSProperty')
  -- hilink('AerialStringIcon', 'String')
  -- hilink('AerialStructIcon', 'TSField')
  -- hilink('AerialTypeParameterIcon', 'TSParameter' )
  -- hilink('AerialVariableIcon', 'TSVariableBuiltin' )
  


  -- hilink("LspSagaFinderSelection", "Search")
  -- hilink("LspSagaFinderSelection", "guifg='#ff0000' guibg='#00ff00")
  --
  M.termcolors(c)

  if config.hideInactiveStatusline then
    local inactive = { style = "underline", bg = c.bg, fg = c.bg, sp = c.border }

    -- StatusLineNC
    theme.base.StatusLineNC = inactive

    -- LuaLine
    for _, section in ipairs({ "a", "b", "c" }) do
      theme.defer["lualine_" .. section .. "_inactive"] = inactive
    end
  end

  return theme
end


return M


