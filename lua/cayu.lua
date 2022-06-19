local util = require("cayu.util")
local theme = require("cayu.theme")

local M = {}

M.colorscheme = function()
  util.load(theme.setup())
end

M.tcolors = function()
  return theme.termcolors(require("cayu.colors"))
end 

M.colors = function()

end

return M
