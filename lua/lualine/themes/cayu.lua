local config = require("cayu.config")
local colors = require("cayu.colors").setup(config)
local util = require("cayu.util")

local cayu = {}

cayu.normal = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.bg_sel, fg = colors.dgreen },
  c = { bg = colors.bg_darker, fg = colors.gray11 },
  x = { bg = colors.bg_darker, fg = colors.gray1 },
  y = { bg = colors.bg_sel, fg = colors.green },
  z = { bg = colors.green, fg = colors.black },
}

cayu.insert = {
  a = { bg = colors.dpurple, fg = colors.black },
  b = { bg = colors.bg_sel, fg = colors.dpurple },
  c = { bg = colors.bg_darker, fg = colors.gray11 },
  x = { bg = colors.bg_darker, fg = colors.gray1 },
  y = { bg = colors.bg_sel, fg = colors.dpurple },
  z = { bg = colors.dpurple, fg = colors.black },
}

cayu.command = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.bg_sel, fg = colors.red },
  c = { bg = colors.bg_darker, fg = colors.gray11 },
  x = { bg = colors.bg_darker, fg = colors.gray1 },
  y = { bg = colors.bg_sel, fg = colors.red },
  z = { bg = colors.red, fg = colors.black },
}

cayu.visual = {
  a = { bg = colors.dyellow, fg = colors.black },
  b = { bg = colors.bg_sel, fg = colors.dyellow },
  c = { bg = colors.bg_darker, fg = colors.gray11 },
  x = { bg = colors.bg_darker, fg = colors.gray1 },
  y = { bg = colors.bg_sel, fg = colors.dyellow },
  z = { bg = colors.dyellow, fg = colors.black },
}

cayu.replace = {
  a = { bg = colors.dblue, fg = colors.black },
  b = { bg = colors.bg_sel, fg = colors.dblue },
  c = { bg = colors.bg_darker, fg = colors.gray11 },
  x = { bg = colors.bg_darker, fg = colors.gray1 },
  y = { bg = colors.bg_sel, fg = colors.dblue },
  z = { bg = colors.dblue, fg = colors.black },
}

cayu.inactive = {
  a = { bg = colors.bg_darker, fg = colors.green },
  b = { bg = colors.bg_darker, fg = colors.bg_sel, gui = "bold" },
  c = { bg = colors.bg_darker, fg = colors.gray1 },
  x = { bg = colors.bg_darker, fg = colors.gray1 },
  y = { bg = colors.bg_darker, fg = colors.bg_sel, gui = "bold" },
  z = { bg = colors.bg_darker, fg = colors.green },
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
