local util = require("cayu.util")

local M = {}

M.c1={}
M.c2={}
  M.c1.accent = "#FC66"
  M.c1.bg = "#1F2430"
  M.c1.fg = "6"
  M.c1.ui = "#707A"

  M.c1.tag = "#CFE6"
  M.c1.func = "#FFD580"
  M.c1.entity = "#73D0FF"
  M.c1.string = "#BAE67E"
  M.c1.regexp = "#95EB"
  M.c1.markup = "#F28779"
  M.c1.keyword = "#FFA759"
  M.c1.special = "#FFD580"
  M.c1.comment = "#677380"
  M.c1.constant = "#D4BFFF"
  M.c1.operator = "#F29E74"
  M.c1.error = "#FF3333"

  M.c1.line = "#191E2A"
  M.c1.panel_bg = "#232834"
  M.c1.panel_shadow = "#141925"
  M.c1.panel_border = "#304551"
  M.c1.gutter_normal = "#404755"
  M.c1.gutter_active = "#5F687A"
  M.c1.selection_bg = "#33415E"
  M.c1.selection_inactive = "#323A"
  M.c1.selection_border = "#232A"
  M.c1.guide_active = "#576070"
  M.c1.guide_normal = "#383E"

  M.c1.vcs_added = "#AC70"
  M.c1.vcs_modified = "#77A8D9"
  M.c1.vcs_removed = "#F27983"

  M.c1.vcs_added_bg = "#313D37"
  M.c1.vcs_removed_bg = "#3E373A"

  M.c1.fg_idle = "#607080"
  M.c1.warning = "#FFA759"





  M.c2.accent = "#E6B450"
  M.c2.bg = "#0A0E14"
  M.c2.fg = "#B3B1AD"
  M.c2.ui = "#4D5566"

  M.c2.tag = "#39BAE6"
  M.c2.func = "#FFB454"
  M.c2.entity = "#52FF"
  M.c2.string = "2D9"
  M.c2.regexp = "#95EB"
  M.c2.markup = "#F07178"
  M.c2.keyword = "#FF8F40"
  M.c2.special = "#E6B673"
  M.c2.comment = "#626A73"
  M.c2.constant = "#FFEE99"
  M.c2.operator = "#F29668"
  M.c2.error = "#FF3333"

  M.c2.line = "#00010A"
  M.c2.panel_bg = "#0D1016"
  M.c2.panel_shadow = "#00010A"
  M.c2.panel_border = "#000000"
  M.c2.gutter_normal = "#323945"
  M.c2.gutter_active = "#464D5E"
  M.c2.selection_bg = "#273747"
  M.c2.selection_inactive = "#1B2733"
  M.c2.selection_border = "#304357"
  M.c2.guide_active = "#393F4D"
  M.c2.guide_normal = "#242A35"

  M.c2.vcs_added = "#91B362"
  M.c2.vcs_modified = "#6994BF"
  M.c2.vcs_removed = "#D975"

  M.c2.vcs_added_bg = "#1D2214"
  M.c2.vcs_removed_bg = "#2D2220"

  M.c2.fg_idle = "#3E4B59"
  M.c2.warning = "#FF8F40"

---@param configonfig
---@returnolorScheme
function M.setup(config)
  config = config or require("cayu.config")

  --olor Palette
  ---@classolorScheme
  local colors = {}

  colors = {
    none = "NONE",
    bg_darker = "#141a24",
    bg_dark   = "#151a22",
    bg        = "#171c26",
    bg_lite   = "#202630",
    bg_hi     = "#242b39",
    bg_sel    = "#303a4f",
    bg_search = "#404e6a",

    fg_darkest     = "#4d525a",
    fg_gutter      = "#343f4c",
    fg_gutter_light= "#4d4751",

    gray1   = "#677380",
    gray2   = "#607080",
    comment = "#526370",

    fg             = "#d9d7ce",
    fg_gray        = "#c3c0ba",
    fg_dark        = "#adb6be",
    gray           = "#556575",

    lllblue    = "#bfdfff",
    llblue    = "#aacfff",
    lblue    = "#9abff0",
    blue    = "#90b0ea",
    dblue    = "#8aa0e8",
    ddblue    = "#7a9ae4",
    dddblue    = "#6a90df",

    lllcyan  = "#bfFFF0",
    llcyan   = "#90FFF0",
    lcyan    = "#8feaef",
    cyan    = "#7fd0da",
    dcyan    = "#5fc0cf",

    llteal    = "#aaffbf",
    lteal    = "#9aeaaf",
    teal    = "#7fd0aa",
    dteal    = "#60c09f",
    ddteal    = "#5ab08a",

    lgreen   = "#daffaa",
    green   = "#d5ff80",
    dgreen   = "#c0fa70",
    ddgreen   = "#aff060",
    dddgreen = "#8ae050",

    lllyellow= "#ffeacf",
    llyellow = "#ffda9f",
    lyellow  = "#ffda8f",
    yellow  = "#ffcf7f",
    dyellow  = "#f0ba5f",
    ddyellow  = "#eaaa5a",

    llorange = "#ffda8f",
    lorange  = "#ffc070",
    orange  = "#ffaf6f",
    dorange  = "#f09a5f",
    ddorange  = "#ea8f5a",

    llred    = "#ffbfbf",
    lred     = "#ffacac",
    red     = "#ff9a9f",
    dred     = "#fa8a8f",
    ddred     = "#f07a6f" ,

    llmagenta = "#faacda", -- @
    lmagenta = "#fa9aca", -- @
    magenta = "#fa9aca", -- @
    dmagenta = "#f080ba", -- @
    ddmagenta = "#ea70aa", -- @


    llpurple = "#f0caff",
    lpurple  = "#dfbfff",
    purple  = "#cfafff",
    dpurple  = "#baa0fa",
    ddpurple  = "#9f90e0",

    white1   = "#faf7ea",
    white2   = "#d9d7ce",

    git = {
      change   = "#a5e0da",
      add      = "#a5fa8a",
      delete   = "#ff908a",
      conflict = "#f0af8f"
    },
    gitSigns = { 
      add    = "#a5fa8a",
      change = "#a5e0da",
      delete = "#fa8a8a"
    },
    diff = {
      add      = "#a5fa8a",
      change   = "#a5e0da",
      delete   = "#ff908a",
    }
  }
  util.bg = colors.bg
  util.day_brightness = config.dayBrightness

  colors.git.ignore = colors.gray
  colors.black = colors.bg_darker
  colors.border_highlight = colors.blue1
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.fg_gutter
  colors.bg_statusline = colors.black

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = (config.transparentSidebar and colors.none) or config.darkSidebar and colors.bg_dark or colors.bg
  colors.bg_float = config.darkFloat and colors.bg_dark or colors.bg

  colors.bg_visual = colors.dblue
  -- colors.bg_search = colors.blue1
  colors.fg_sidebar = colors.fg_dark

  colors.error = colors.lred
  colors.warning = colors.orange
  colors.info = colors.blue
  colors.hint = colors.lteal

  util.color_overrides(colors, config)

  if config.transform_colors and (config.style == "day" or vim.o.background == "light") then
    return util.light_colors(colors)
  end

  return colors
end

return M

