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
  M.c1.comment = "#6773"
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
    -- bg = "#141a24",
    bg = "#171c26",
    terminal_black = "#141a24",
    bg_highlight = "#272d3a",
    bg_sel = "#302e50",
    dark4 = "#202630",
    comment = "#505568",
    dark3= "#677380",
    dark5= "#607080",

    fg             = "#d9d7ce",
    fg_dark        = "#adb6be",
    fg_darkest     = "#4d525a",
    gray           = "#556575",
    fg_gray        = "#c3c0ba",
    bg_dark        = "#151a22",

    fg_gutter      = "#343f4c",
    fg_gutter_light= "#4d4751",





    blue1    = "#aacfff",
    blue2    = "#9abff0",
    blue3    = "#7fa0ea",
    blue4    = "#6a90df",

    cyan1    = "#8feaef",
    cyan2    = "#7fd0da",
    cyan3    = "#5fc0cf",

    teal1    = "#9aeaaf",
    teal2    = "#7fd0aa",
    teal3    = "#60c09f",

    green1   = "#bafa90",
    green2   = "#aae07a",
    green3   = "#8acf6f",

    yellow0  = "#ffda8f",
    yellow1  = "#ffca6f",
    yellow2  = "#f0ba5f",
    yellow3  = "#eaaa5a",

    orange1  = "#ffaf6f",
    orange2  = "#f09a5f",
    orange3  = "#ea8f5a",

    red1     = "#ff9a9f",
    red2     = "#fa8a8f",
    red3     = "#f07a6f" ,

    magenta1 = "#fa9aca", -- @
    magenta2 = "#fa9aca", -- @
    magenta3 = "#f080ba", -- @
    magenta4 = "#ea70aa", -- @

    purple1  = "#cfafff",
    purple2  = "#b0a0fa",
    purple3  = "#9f90ea",
    purple4  = "#8f80ea",

    white1   = "#faf7ea",
    white2   = "#d9d7ce",

    git = {
      change   = "#95e6cb",
      add      = "#bbe67e",
      delete   = "#ff90a0",
      conflict = "#bb7a61"
    },
    gitSigns = { 
      add    = "#cce78e",
      change = "#95e6bb",
      delete = "#ff90a0"
    },
  }
  util.bg = colors.bg
  util.day_brightness = config.dayBrightness

  colors.diff = {
    add = util.darken(colors.green2, 0.15),
    delete = util.darken(colors.red1, 0.15),
    change = util.darken(colors.blue2, 0.15),
    text = colors.blue7,
  }

  colors.gitSigns = {
    add = util.brighten(colors.gitSigns.add, 0.2),
    change = util.brighten(colors.gitSigns.change, 0.2),
    delete = util.brighten(colors.gitSigns.delete, 0.2),
  }

  colors.git.ignore = colors.dark3
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = colors.blue1
  colors.border = colors.black

    colors.blue     = colors.blue2
    colors.lblue    = colors.blue1
    colors.dblue    = colors.blue3
    colors.ddblue   = colors.blue4

    colors.cyan     = colors.cyan2
    colors.lcyan    = colors.cyan1
    colors.dcyan    = colors.cyan3

    colors.teal     = colors.teal2
    colors.lteal     = colors.teal1
    colors.dteal     = colors.teal3

    colors.green    = colors.green2
    colors.dgreen   = colors.green3
    colors.lgreen   = colors.green1

    colors.yellow   = colors.yellow1
    colors.dyellow  = colors.yellow2
    colors.ddyellow = colors.yellow3
    colors.lyellow  = colors.yellow0

    colors.orange   = colors.orange2
    colors.dorange  = colors.orange3
    colors.lorange  = colors.orange1

    colors.red      = colors.red2
    colors.dred     = colors.red3
    colors.lred     = colors.red1

    colors.magenta  = colors.magenta2
    colors.dmagenta = colors.magenta3
    colors.ddmagenta= colors.magenta4
    colors.lmagenta = colors.magenta1

    colors.purple   = colors.purple2
    colors.lpurple  = colors.purple1
    colors.dpurple = colors.purple3
    colors.ddpurple = colors.purple4
  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.fg_gutter
  colors.bg_statusline = colors.black

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = (config.transparentSidebar and colors.none) or config.darkSidebar and colors.bg_dark or colors.bg
  colors.bg_float = config.darkFloat and colors.bg_dark or colors.bg

  colors.bg_visual = util.darken(colors.blue1, 0.7)
  colors.bg_search = colors.blue1
  colors.fg_sidebar = colors.fg_dark

  colors.error = colors.red1
  colors.warning = colors.yellow1
  colors.info = colors.blue2
  colors.hint = colors.teal1

  util.color_overrides(colors, config)

  if config.transform_colors and (config.style == "day" or vim.o.background == "light") then
    return util.light_colors(colors)
  end

  return colors
end

return M

