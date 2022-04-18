local util = require("cayu.util")
local theme = require("cayu.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
