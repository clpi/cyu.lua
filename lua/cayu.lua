local util = require("cayu.util")
local theme = require("cayu.theme")

local M = {}

M.colorscheme = function()
  util.load(theme.setup())
end

M.colors = function()

end

return M
