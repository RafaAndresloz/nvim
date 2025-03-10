local function save_theme(theme)
  local file = io.open(vim.fn.stdpath("config") .. "/theme_last_used", "w")
  if file then
    file:write(theme)
    file:close()
  end
end

local function load_last_theme()
  local file = io.open(vim.fn.stdpath("config") .. "/theme_last_used", "r")
  if file then
    local theme = file:read("*all")
    file:close()
    return theme
  end
end

local function apply_theme(theme)
  local success, _ = pcall(vim.cmd, "colorscheme " .. theme)
  if success then
    save_theme(theme) -- Guarda el tema aplicado
    vim.notify("Tema aplicado: " .. theme, "info", { title = "Cambio de Tema" })
  else
    vim.notify("Error al aplicar el tema: " .. theme, "error", { title = "Error de Tema" })
  end
end

local function get_installed_themes()
  return vim.fn.getcompletion("", "color")
end

local function select_theme()
  local themes = get_installed_themes()
  if #themes == 0 then
    vim.notify("No se encontraron temas instalados", "error", { title = "Error" })
    return
  end

  local telescope = require("telescope.pickers")
  local finders = require("telescope.finders")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  telescope.new({}, {
    prompt_title = "Seleccionar Tema",
    finder = finders.new_table({ results = themes }),
    sorter = require("telescope.config").values.generic_sorter({}),
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        apply_theme(entry.value)
      end)
      return true
    end,
  }):find()
end

return {
  select_theme = select_theme,
  load_last_theme = load_last_theme,
}

