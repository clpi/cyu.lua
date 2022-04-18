local config = require("cayu.config")
local colors = require("cayu.colors").setup(config)
local util = require("cayu.util")

local cayu = {}

cayu.normal = {
  a = { bg = colors.green2, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.green2 },
  c = { bg = colors.bg_statusline, fg = colors.gray },
  x = { bg = colors.bg_statusline, fg = colors.gray },
  y = { bg = colors.fg_gutter, fg = colors.green2 },
  z = { bg = colors.green2, fg = colors.black },
}

cayu.insert = {
  a = { bg = colors.orange, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.orange },
  y = { bg = colors.fg_gutter, fg = colors.orange },
  z = { bg = colors.orange, fg = colors.black },
}

cayu.command = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.red },
  y = { bg = colors.fg_gutter, fg = colors.red },
  z = { bg = colors.red, fg = colors.black },
}

cayu.visual = {
  a = { bg = colors.purple, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.purple },
  y = { bg = colors.fg_gutter, fg = colors.purple },
  z = { bg = colors.purple, fg = colors.black },
}

cayu.replace = {
  a = { bg = colors.blue, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.blue },
  y = { bg = colors.fg_gutter, fg = colors.blue },
  z = { bg = colors.fg_gutter, fg = colors.blue },
}

cayu.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.gray },
  x = { bg = colors.bg_statusline, fg = colors.gray },
  y = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  z = { bg = colors.bg_statusline, fg = colors.fg_gutter },
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
