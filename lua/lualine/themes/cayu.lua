local config = require("cayu.config")
local colors = require("cayu.colors").setup(config)
local util = require("cayu.util")

local cayu = {}

cayu.normal = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.green },
  c = { bg = colors.bg_statusline, fg = colors.gray },
  x = { bg = colors.bg_statusline, fg = colors.gray },
  y = { bg = colors.fg_gutter, fg = colors.green },
  z = { bg = colors.green, fg = colors.black },
}

cayu.insert = {
  a = { bg = colors.purple, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.purple },
  y = { bg = colors.fg_gutter, fg = colors.purple },
  z = { bg = colors.purple, fg = colors.black },
}

cayu.command = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.red },
  y = { bg = colors.fg_gutter, fg = colors.red },
  z = { bg = colors.red, fg = colors.black },
}

cayu.visual = {
  a = { bg = colors.yellow, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.yellow },
  y = { bg = colors.fg_gutter, fg = colors.yellow },
  z = { bg = colors.yellow, fg = colors.black },
}

cayu.replace = {
  a = { bg = colors.blue, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.blue },
  y = { bg = colors.fg_gutter, fg = colors.blue },
  z = { bg = colors.blue, fg = colors.black },
}

cayu.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.green },
  b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.gray },
  x = { bg = colors.bg_statusline, fg = colors.gray },
  y = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  z = { bg = colors.bg_statusline, fg = colors.green },
}

if vim.o.background == "light" then
  for _, mode in pairs(cayu) do
    for _, section in pairs(mode) do
      if section.bg then
        section.bg = util.getColor(section.bg)
      end
      if section.fg then
        section.fg = util.getColor(section.fg)
      end
    end
  end
end

if vim.g.cayu_lualine_bold then
  for _, mode in pairs(cayu) do
    mode.a.gui = "bold"
  end
end

return cayu
