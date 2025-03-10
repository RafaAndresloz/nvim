require("keys")
require("plugin")
require("config")

-- COLORSCHEME CONFIGURATION
local theme_picker = require("theme_picker")
local last_theme = theme_picker.load_last_theme()
if last_theme then
  local success, _ = pcall(vim.cmd, "colorscheme " .. last_theme)
  if not success then
    vim.notify("No se pudo cargar el último tema: " .. last_theme, "error")
  end
end


