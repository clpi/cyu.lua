local util = require("cayu.util")
local colors = require("cayu.colors")
local hl = vim.api.nvim_set_hl
local hilink = function(name, link) 
  hl(0, name, { link = link })
end
-- @NOTE: applies no fg or bg colors , only style
local style = function(name, style)
  

end
local color = function(name, fg, bg, style)
  if name and fg and bg and style then 
    hl(0, name, { fg = fg, bg = bg, style = style})
  end
end
local C = colors.c1

local M = {}

---@param config Config
---@return Theme
function M.setup(config)
  config = config or require("cayu.config")

  ---@class Theme
  local theme = {}
  theme.config = config
  theme.colors = colors.setup(config)
  local c = theme.colors

  theme.base = {
    Comment = { fg = c.comment, style = config.commentStyle },
    ColorColumn = { bg = c.black },
    Conceal = { fg = c.dark5 },
    Cursor = { fg = c.bg, bg = c.fg },
    lCursor = { fg = c.bg, bg = c.fg },
    CursorIM = { fg = c.bg, bg = c.fg },
    CursorColumn = { bg = c.bg_highlight },
    CursorLine = { bg = c.bg_highlight },
    Directory = { fg = c.orange },
    DiffAdd = { bg = c.diff.add },
    DiffChange = { bg = c.diff.change },
    DiffDelete = { bg = c.diff.delete },
    DiffText = { bg = c.diff.text },
    EndOfBuffer = { fg = c.bg },
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.error }, -- error messages on the command line
    VertSplit = { fg = c.border }, -- the column separating vertically split windows
    Folded = { fg = c.blue, bg = c.fg_gutter }, -- line used for closed folds
    FoldColumn = { bg = c.bg, fg = c.comment }, -- 'foldcolumn'
    SignColumn = { bg = config.transparent and c.none or c.bg, fg = c.fg_gutter }, -- column where |signs| are displayed
    SignColumnSB = { bg = c.bg_sidebar, fg = c.fg_gutter }, -- column where |signs| are displayed
    Substitute = { bg = c.red, fg = c.black }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.fg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    MatchParen = { fg = c.yellow, bg=c.bg_highlight, style = "bold" },
    CursorLineNr = { fg = c.orange1 },
    ModeMsg = { fg = c.fg_dark, style = "bold" },
    MsgArea = { fg = c.fg_dark },
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.blue },
    NonText = { fg = c.dark3 },
    Normal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    NormalNC = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NormalFloat = { fg = c.fg, bg = c.bg_float },
    FloatBorder = { fg = c.border_highlight, bg = c.bg_float },
    Pmenu = { bg = c.bg_popup, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { fg = c.yellow2, style = "bold"}, -- Popup menu: selected item.
    PmenuSbar = { bg = c.darkest, style = "bold"}, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.fg_gutter }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg_visual, style = "bold" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.bg_search, style="bold"}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = c.bg_search, style="bold" }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"

    SpecialKey = { fg = c.dark3 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.error, style = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.warning, style = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.hint, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.fg_darkest, bg = c.black }, -- status line of current window
    StatusLineNC = { fg = c.comment, bg = c.black }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.bg_statusline, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.black }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.bg, bg = c.yellow }, -- tab pages line, active tab page label
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
    Character = { fg = c.purple2 }, --  a character constant: 'c', '\n'
    -- Number        = { }, --   a number constant: 234, 0xff
    -- Boolean       = { }, --  a boolean constant: TRUE, false
    -- Float         = { }, --    a floating point constant: 2.3e10

    Identifier = { fg = c.orange }, -- , style = config.variableStyle }, -- (preferred) any variable name
    Function = { fg = c.yellow }, -- , style = config.functionStyle }, -- function name (also: methods for classes)


    Statement = { fg = c.yellow }, -- (preferred) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = { fg = C.operator, }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.purple}, -- style = config.keywordStyle }, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = { fg = c.llyellow , style = "italic"}, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type      = { fg = c.orange }, -- (preferred) int, long, char, etc.
    -- StorageClass  = { }, -- static, register, volatile, etc.
    Structure = { fg = c.yellow , style = "bold"}, --  struct, union, enum, etc.
    Typedef       = { fg = c.red }, --  A typedef

    Special     = { fg = c.yellow1 }, -- (preferred) any special symbol
    SpecialChar = { fg = c.red1, style = "italic" }, --  special character in a constant
    Tag         = { fg = c.blue2 }, --    you can use CTRL-] on this
    Delimiter     = {fg=c.red1 }, --  character that needs attention
    SpecialComment= { fg=c.yellow2, style="italic"}, -- special things inside a comment
    -- Debug         = { }, --    debugging statements

    Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
    Bold = { style = "bold" },
    Italic = { style = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.red1 , style="bold"}, -- (preferred) any erroneous construct
    Todo = { bg = c.none, fg = c.yellow , style="bold"}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Note = { bg = c.none, fg=c.yellow,style="bold"},

    qfLineNr = { fg = c.dark5 },
    qfFileName = { fg = c.purple },

    cString = { fg = c.green, style = "italic" },

    htmlH1 = { fg = c.magenta, style = "bold" },
    htmlH2 = { fg = c.blue, style = "bold" },
    htmlH3 = { fg = c.purple, style = "bold" },
    htmlH4 = { fg = c.red, style = "bold" },
    htmlH5 = { fg = c.orange, style = "bold"},
    htmlH6 = { fg = c.yellow, style = "bold"},

    mkdHeading = { fg = c.orange, style = "bold" },
    mkdCode = { bg = c.terminal_black, fg = c.fg },
    mkdCodeDelimiter = { bg = c.terminal_black, fg = c.fg },
    mkdCodeStart = { fg = c.teal, style = "bold" },
    mkdCodeEnd = { fg = c.teal, style = "bold" },
    mkdLink = { fg = c.blue, style = "underline" },

    jsonTSLabel = { fg = c.orange2 },

    markdownHeadingDelimiter = { fg = c.orange, style = "bold" },
    markdownCode = { fg = c.teal },
    markdownCodeBlock = { fg = c.teal },
    markdownH1 = { fg = c.magenta, style = "bold" },
    markdownH2 = { fg = c.blue, style = "bold" },
    markdownH3 = { fg = c.purple, style = "bold" },
    markdownH4 = { fg = c.red, style = "bold" },
    markdownH5 = { fg = c.orange, style = "bold"},
    markdownH6 = { fg = c.yellow, style = "bold"},
    markdownLinkText = { fg = c.blue, style = "underline" },

    tsxTSConstructor = { fg = c.orange2, style = "bold,italic"},
    tsxTSTagAttribute = { fg = c.dpurple, style = "italic"},
    typescriptTSConstructor = { fg = c.orange1, style = "bold"},
    yamlTSField = { fg = c.cyan2 },
    -- NvimLambda = { fg = c.magenta, style = "bold" },
    -- NvimCurly = { fg = C.operator},-- style = "bold" },


    debugPC = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = util.darken(c.info, 0.1), fg = c.info }, -- used for breakpoint colors in terminal-debug

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

    DiagnosticVirtualTextError = { bg = util.darken(c.error, 0.1), fg = c.error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = util.darken(c.warning, 0.1), fg = c.warning }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = util.darken(c.info, 0.1), fg = c.info }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = util.darken(c.hint, 0.1), fg = c.hint }, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { style = "undercurl", sp = c.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { style = "undercurl", sp = c.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { style = "undercurl", sp = c.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { style = "undercurl", sp = c.hint }, -- Used to underline "Hint" diagnostics

    LspSignatureActiveParameter = { fg = c.orange },
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
    TSDanger          = { fg = c.error , style = 'bold'},
    TSConstructor     = { fg = c.lyellow },
    TSConditional       = { fg=c.red2, style = "italic"};
    TSConstant          = { fg=c.purple2};
    TSConstBuiltin      = { fg=c.magenta1, style = "italic"};
    TSConstMacro        = { fg=c.blue2, style="italic,bold" };
    TSDebug           = { fg = c.lcyan };
    TSError           = { fg = c.red2 };
    TSException         = {fg=c.red1 };
    TSField           = { fg = c.lblue };
    TSFloat           = { fg = c.purple2 };
    TSFuncBuiltin     = { fg = c.yellow2, style = "bold,italic" };
    TSFunction        = { fg = c.yellow, style = "italic" };
    TSFuncMacro       = { fg = c.lyellow, style = "bold"},-- style = "" };
    TSInclude         = { fg = c.yellow, style = "italic" };
    TSKeyword         = { fg = c.lorange, style = "italic"};
    TSKeywordFunction = { fg = c.dyellow, style ="bold"};
    TSKeywordReturn = { fg = c.orange, style = "bold,italic"};
    TSKeywordOperator = { fg = c.red}, style = "italic";
    TSLabel           = { fg = c.purple, style = 'italic' },
    TSEnvironment     = { fg = c.teal },
    TSEnvironmentName = { fg = c.teal, style = "italic" },
    TSMath            = { fg = c.lmagenta },

    TSMethod            = { fg=c.orange2, style="italic"},
    TSNamespace         = { fg = c.purple1},
    -- TSNone              = { };    2-- TODO: docs
    TSNumber            = { fg=c.purple}; 
    TSOperator        = { fg = c.red1 },
    TSParameter       = { fg = c.dorange }, -- For parameters of a function.
    TSParameterReference= { fg=c.dorange, style="italic"};    -- For references to parameters of a function.
    TSProperty        = { fg = c.blue3 , style="italic"}, -- Same as `TSField`.
    TSPunctDelimiter  = { fg = c.red1 },
    TSPunctBracket    = { fg = c.red2, },
    TSPunctSpecial    = { fg = c.orange3 },
    TSRepeat            = { fg=c.orange, style="italic"};    -- For keywords related to loops.
    TSString          = { fg = c.green1, style = "italic" }; -- For strings.
    cTSString         =  { fg = c.green1, style = "italic" }; -- For strings.
    cTSStringEscape   =  { fg = c.yellow, style = "italic"},
    cppRawString      = { fg = c.yellow, style = "italic"},
    TSStringRegex     = { fg = c.teal1 }, -- For regexes.
    TSStringEscape    = { fg = c.orange1 }, -- For escape characters within a string.
    TSStringSpecial   = { fg = c.yellow1, style = 'italic'};
    TSSymbol          = { fg = c.cyan2, style = "bold,italic" }; -- For identifiers referring to symbols or atoms.
    TSPreProc = { fg = c.llyellow, style = "italic"};
    TSDefine = { fg = c.dorange, style = "bold"};

    TSStorageClass = { fg = c.cyan2 };

    TSType            = { fg = c.blue2,};
    TSTypeBuiltin     = { fg = c.cyan,style="italic" };
    TSTypeQualifier   = { fg = c.purple2, style = "italic" };
    TSTypeDefinition  = { fg = c.blue1, style = "bold"};

    TSVariable        = { fg = c.cyan }; --, style = "italic"};
    TSVariableBuiltin = { fg = c.teal , style = "italic"}, -- Variable names that are defined by the languages, like `this` or `self`.
     

    TSTag           = { fg = c.cyan2 }; -- Tags like html tag names.
    TSTagAttribute  = { fg = c.teal, style = "italic" }; -- Tags like html tag names.
    TSTagDelimiter  = { fg = c.red }; -- Tag delimiter like `<` `>` `/`
    TSText              = {  fg = c.fg },
    TSTitle             = {  fg = c.lblue },
    TSTextReference = { fg = c.teal, style ="italic" },
    TSEmphasis          = { style = "italic,bold"};    -- For text to be represented with emphasis.
    TSUnderline         = { style = "underline" };    -- For text to be represented with an underline.
    TSStrike            = { style = "strikethrough" };    -- For strikethrough text.

    TSLiteral           = { fg = c.teal };    -- Literal text.
    TSURI               = { fg=c.lblue, style="italic"};    -- Any URI like a link or email.

    -- BQF
    PreviewBorder       = { fg = c.gray };
    BqfPreviewRange     = { bg = c.bg_search, style = "bold" };


    NotifyERRORBorder= { fg = c.red },
    NotifyWARNBorder= { fg = c.yellow },
    NotifyINFOBorder={ fg = c.green },
    NotifyDEBUGBorder={ fg = c.grey },
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
    Vimwikigray    = { fg=c.dark5, bg = c.none};
    Vimwikibgray    = { fg=c.dark3, bg = c.none};
    VimwikiCode    = { fg=c.lpurple };
    VimwikiCodeT   = { fg = c.lpurple , style = "italic"};
    VimwikiMath    = { fg = c.yellow };
    VimwikiMathT   = { fg = c.yellow1 };
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
    VimwikiCodeChar = { fg = c.dpurple };
    VimwikiCodeCharT = { fg = c.lpurple };
    VimwikiDelimiter = { fg = c.dred };
    VimwikiEqInCharT = { fg = c.lmagenta };
    VimwikiListTodo = { fg = c.lorange, };
    VimwikiPreDelim = { fg = c.dmagenta, };
    VimwikiHeaderChar = { fg = c.dyellow, style = "bold"};
    VimwikiHeaderCharT = { fg = c.lorange, style = "italic,bold"};

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
    LspTroubleCount = { fg = c.magenta, bg = c.fg_gutter },
    LspTroubleNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },

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



    -- Neogit
    NeogitBranch = { fg = c.magenta },
    NeogitRemote = { fg = c.purple },
    NeogitHunkHeader = { bg = c.bg_highlight, fg = c.fg },
    NeogitHunkHeaderHighlight = { bg = c.fg_gutter, fg = c.blue },
    NeogitDiffContextHighlight = { bg = util.darken(c.fg_gutter, 0.5), fg = c.fg_dark },
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
    TelescopeBorder = { fg = c.border_highlight, bg = c.bg_float },
    TelescopeNormal = { fg = c.fg, bg = c.bg_float },
    TelescopePreviewMatch = { c = c.fg, bg = c.bg },

    TelescopePromptNormal = { fg = c.fg, bg = c.black },
    TelescopePromptPrefix = { fg = c.magenta, bg = c.black },
    TelescopeSelectionCaret = { fg = c.magenta2 },
    TelescopePromptCounter = { fg = c.gray },
    TelescopePromptBorder = { fg = c.border_highlight },
    TelescopeSelection = { fg = c.white1, bg = c.bg_sel, style = "bold" },
    TelescopeMatching = { fg = c.yellow1 },
    TelescopePreviewTitle = { fg = c.yellow1, bg = c.bg },
    TelescopeResultsTitle = { fg = c.bg, red1 = c.bg },
    TelescopePromptTitle = { fg = c.orange1, bg = c.bg },

    -- NvimTree
    NvimTreeNormal = { fg = c.fg_gray, bg = c.bg_sidebar },
    NvimTreeSignColumn = { fg = c.gray, bg=c.black},
    NvimTreeWindowPicker = { bg=c.bg_sel},
    NvimTreeOpenedFolderName = { fg = c.green2, style="bold", },
    NvimTreeFolderIcon = { fg = c.orange2, style="bold", },
    NvimTreeEmptyFolderName = { fg = c.yellow, style="italic"},
    NvimTreeNormalNC = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NvimTreeRootFolder = { fg = c.green, style = "bold" },
    NvimTreeGitDirty = { fg = c.git.change },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeSpecialFile = { fg = c.purple, style = "italic" },
    NvimTreeIndentMarker = { fg = c.gray },
    NvimTreeImageFile = { fg = c.fg_sidebar },
    NvimTreeSymlink = { fg = c.blue1 , style = "italic"},
    NvimTreeVertSplit = { fg = c.comment },
    NvimTreeCursorLine = { bg = c.bg_highlight},
    NvimTreeFolderName = { fg = c.yellow},--, style = "bold" },
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

    LspFloatWinNormal = { bg = c.bg_float },
    LspFloatWinBorder = { fg = c.border_highlight },
    LspSagaBorderTitle = { fg = c.cyan },
    LspSagaHoverBorder = { fg = c.blue },
    LspSagaRenameBorder = { fg = c.green },
    LspSagaDefPreviewBorder = { fg = c.green },
    LspSagaCodeActionBorder = { fg = c.blue },
    LspSagaFinderSelection = { fg = c.bg_visual },
    LspSagaCodeActionTitle = { fg = c.blue1 },
    LspSagaCodeActionContent = { fg = c.purple },
    LspSagaSignatureHelpBorder = { fg = c.red },
    ReferencesCount = { fg = c.purple },
    DefinitionCount = { fg = c.purple },
    DefinitionIcon = { fg = c.blue },
    ReferencesIcon = { fg = c.blue },
    TargetWord = { fg = c.cyan },

    -- NeoVim
    healthError = { fg = c.error },
    healthSuccess = { fg = c.green1 },
    healthWarning = { fg = c.warning },

    -- BufferLine
    BufferLinePick  = { fg = c.yellow, style = "bold"};
    BufferLinePickVisible  = { fg = c.imagneta, style = "bold"};
    BufferLineModified = { fg = c.green };
    BufferLineHintDiagnostic = { fg = c.dcyan };
    BufferLineInfoDiagnostic = { fg = c.blue };
    BufferLineErrorSelected = { fg = c.dred, style = "bold" };
    BufferLineFill = { bg = c.black },
    BufferLineBufferSelected = { fg = c.lgreen};
    BufferLineBuffer = { fg = c.gray };
    BufferLineTabSelected = { fg = c.orange, style = "bold"};
    BufferLineWarningSelected = { fg = c.yellow, style = "bold"};
    BufferLineNumbersSelected = { fg = c.green, bg = c.bg_highlight, style = "bold"};
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
    BufferInactive = { bg = c.bg_statusline, fg = c.dark5 },
    BufferInactiveIndex = { bg = c.bg_statusline, fg = c.dark5 },
    BufferInactiveMod = { bg = c.bg_statusline, fg = util.darken(c.warning, 0.7) },
    BufferInactiveSign = { bg = c.bg_statusline, fg = c.border_highlight },
    BufferInactiveTarget = { bg = c.bg_statusline, fg = c.red },
    BufferTabpages = { bg = c.bg_statusline, fg = c.none },
    BufferTabpage = { bg = c.bg_statusline, fg = c.border_highlight },

    -- Sneak
    Sneak = { fg = c.bg_highlight, bg = c.magenta },
    SneakScope = { bg = c.bg_visual },

    -- Hop
    HopNextKey = { fg = c.magenta2, style = "bold" },
    HopNextKey1 = { fg = c.blue2, style = "bold" },
    HopNextKey2 = { fg = util.darken(c.blue2, 0.3), style = "bold" },
    HopUnmatched = { fg = c.dark3 },

    LightspeedGreyWash = { fg = c.dark3 },
    -- LightspeedCursor = { link = "Cursor" },
    LightspeedLabel = { fg = c.magenta2, style = "bold,underline" },
    LightspeedLabelDistant = { fg = c.green1, style = "bold,underline" },
    LightspeedLabelDistantOverlapped = { fg = c.green2, style = "underline" },
    LightspeedLabelOverlapped = { fg = c.magenta2, style = "underline" },
    LightspeedMaskedChar = { fg = c.orange },
    LightspeedOneCharMatch = { bg = c.magenta2, fg = c.fg, style = "bold" },
    LightspeedPendingOpArea = { bg = c.magenta2, fg = c.fg },
    LightspeedShortcut = { bg = c.magenta2, fg = c.fg, style = "bold,underline" },
    -- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
    -- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
    LightspeedUnlabeledMatch = { fg = c.blue2, style = "bold" },

    -- Cmp
    CmpDocumentation = { fg = c.fg, bg = c.bg_float },
    CmpDocumentationBorder = { fg = c.border_highlight, bg = c.bg_float },

    CmpItemAbbr = { fg = c.fg_gray, bg = c.none },
    CmpItemAbbrDefault = { fg = c.green, bg= c.none}, --, style="bold"},
    -- CmpItemKind = { style = "bold" },
    -- CmpItemKindColor = { style = "bold" },
    cmpItemKindDefault = { fg = c.fg, bg = c.none },
    CmpItemKindFileDefault = { fg = c.yellow}, --, style="bold"},
    CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none},-- style = "strikethrough" },

    CmpItemKindDefault = { fg = c.blue, bg = c.none}, --style="bold" },
    CmpItemMenu = { fg = c.gray, bg = c.none },

    CmpItemKindFile = { fg = c.yellow, bg = c.none },-- style="bold"},
    CmpItemKindFolder = { fg = c.blue, bg = c.none}, --style="bold"},
    CmpItemKindKeyword = { fg = c.orange, bg = c.none},-- style="bold"},
    CmpItemKindKeywordVariable = { fg = c.purple, bg = c.none }, --style="bold"},
    CmpItemAbbrMatch = { fg = c.orange1, bg = c.none },--style = "bold"},-- style = "bold" },
    CmpItemAbbrMatchFuzzy = { fg = c.yellow2, bg=c.none},--style = "bold" },

    CmpItemKindVariable = { fg = c.blue1, bg = c.none },
    CmpItemKindConstant = { fg = c.purple2, bg = c.none },
    CmpItemKindReference = { fg = c.magenta2, bg = c.none },
    CmpItemKindValue = { fg = c.teal, bg = c.none },

    CmpItemKindFunction = { fg = c.yellow, bg = c.none },
    CmpItemKindMethod = { fg = c.yellow3, bg = c.none},-- style = "bold" },
    CmpItemKindConstructor = { fg = c.orange2, bg = c.none}, --style = "bold" },

    CmpItemKindClass = { fg = c.orange1, bg = c.none},--, style = "bold" },
    CmpItemKindInterface = { fg = c.yellow2, bg = c.none},--, style = "bold" },
    CmpItemKindStruct = { fg = c.orange2, bg = c.none},--, style = "bold" },
    CmpItemKindEvent = { fg = c.red1, bg = c.none},--, style = "bold" },
    CmpItemKindEnum = { fg = c.purple2, bg = c.none},--, style = "bold" },
    CmpItemKindUnit = { fg = c.magenta1, bg = c.none},--, style = "bold" },

    CmpItemKindModule = { fg = c.orange1, bg = c.none},--, style = "bold" },
    CmpItemKindText = { fg = c.green3, bg=c.none},--, style = "bold" },

    CmpItemKindProperty = { fg = c.dblue, bg = c.none},--, style = "bold" },
    CmpItemKindField = { fg = c.lblue, bg = c.none},-- style = "bold" },
    CmpItemKindTypeParameter = { fg = c.purple1, bg = c.none},-- style = "bold"},
    CmpItemKindEnumMember = { fg = c.orange2, bg = c.none}, --style = "bold"},
    CmpItemKindOperator = { fg = c.red, bg = c.none}, --style = "bold"},
    CmpItemKindSnippet = { fg = c.purple, bg = c.none}, --style = "bold" },

    SearchBoxMatch = { bg=c.bg_sel, style = "bold" },

    cppTSProperty = { fg = c.llyellow, style = "italic" },
    bashTSFuncBuiltin = { fg = c.dorange, style = "italic,bold" },
    bashTSParameter = { fg = c.dpurple, style = "italic" },

    luaTSConstructor = { fg = c.lmagenta, style = "bold"},

  }

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
  hilink('AerialArrayIcon', 'Constant')
  hilink('AerialBooleanIcon', 'Boolean')
  hilink('AerialClassIcon', 'Type')
  hilink('AerialConstantIcon', 'Constant')
  hilink('AerialConstructorIcon', 'TSConstructor')
  hilink('AerialEnumIcon', 'Type')
  hilink('AerialEnumMemberIcon','TSField')
  hilink('AerialEventIcon', 'Type')
  hilink('AerialFieldIcon', 'String')
  hilink('AerialFileIcon', 'Include')
  hilink('AerialFunctionIcon', 'Function')
  hilink('AerialInterfaceIcon', 'Type')
  hilink('AerialKeyIcon', 'Type')
  hilink('AerialMethodIcon', 'TSMethod')
  hilink('AerialModuleIcon', 'Include')
  hilink('AerialNamespaceIcon', 'TSNamespace')
  hilink('AerialNullIcon', 'Type')
  hilink('AerialNumberIcon', 'Number')
  hilink('AerialObjectIcon', 'TSField')
  hilink('AerialOperatorIcon', '')
  hilink('AerialPackageIcon', 'Include')
  hilink('AerialPropertyIcon', 'TSProperty')
  hilink('AerialStringIcon', 'String')
  hilink('AerialStructIcon', 'TSField')
  hilink('AerialTypeParameterIcon', 'TSParameter' )
  hilink('AerialVariableIcon', 'TSVariableBuiltin' )

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


