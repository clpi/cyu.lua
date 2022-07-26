local util = require("cayu.util")

local M = {}

M.colors = {
  none = "NONE",
  bg_darker = "#141623",
  bg_dark   = "#151924",
  bg_darkish= "#151a22",
  bg        = "#171c26",
  bg_lite   = "#202630",
  bg_hi     = "#242b39",
  bg_sel    = "#303a4f",
  bg_search = "#404e6a",

  fg_gutter      = "#343f4c",
  fg_darkest     = "#4d525a",
  fg_gutter_light= "#4d4751",

  lgray           = "#677380",
  gray            = "#607080",
  dgray           = "#556575",
  comment = "#526370",

  fg             = "#d9d7ce",
  fg_gray        = "#c3c0ba",
  fg_dark        = "#adb6be",

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

M.config = function(cfg)
  return cfg or require("cayu.config")
end

---@param configonfig
---@returnolorScheme
function M.setup(cfg)
  config = M.config(cfg)

  M.colors.git.ignore = M.colors.gray
  M.colors.black = M.colors.bg_dark
  M.colors.border_highlight = M.colors.gray
  M.colors.border = M.colors.black

  -- Popups and statusline always get a dark background
  M.colors.bg_popup = M.colors.fg_gutter
  M.colors.bg_statusline = M.colors.black

  -- Sidebar and Floats are configurable
  M.colors.bg_sidebar = M.colors.bg_dark
  -- M.colors.bg_float = config.darkFloat and M.colors.bg_dark or M.colors.bg

  -- M.colors.bg_visual = M.colors.dblue
  -- colors.bg_search = colors.blue1
  M.colors.fg_sidebar = M.colors.fg_dark

  M.colors.error = M.colors.lred
  M.colors.warning = M.colors.orange
  M.colors.info = M.colors.blue
  M.colors.hint = M.colors.lteal

  -- util.color_overrides(colors, config)

  if config.transform_colors and (config.style == "day" or vim.o.background == "light") then
    return util.light_colors(M.colors)
  end

  return M.colors
end

return M

