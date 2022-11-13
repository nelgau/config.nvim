local M = {
  terminals = {},
}

function M.setup()
  local toggleterm = require("toggleterm")

  toggleterm.setup({
    size = 40,
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  })

  M.define_terminal("main", [[<c-\>]], M.default_shell_cmd())
end

function M.define_terminal(name, mapping, cmd)
  local Terminal = require("toggleterm.terminal").Terminal

  function build_command(method)
    return "<cmd>lua __toggleterm__" .. method .. "('" .. name .. "')<CR>"
  end

  local keymap = vim.api.nvim_set_keymap
  local buf_keymap = vim.api.nvim_buf_set_keymap
  local kopt = {noremap = true, silent = true}

  M.terminals[name] = Terminal:new({
    cmd = cmd,
    clear_env = true,
    on_open = function(term)
      buf_keymap(term.bufnr, "t", mapping, build_command("toggle"), kopt)
      buf_keymap(term.bufnr, "t", "<c-l>", build_command("clear"), kopt)
    end,
  })

  keymap("n", mapping, build_command("toggle"), kopt)
end

function M.default_shell_cmd()
  -- From http://lua-users.org/wiki/CommonFunctions
  -- TODO: Seems unnecessary. Is there a better way to do this?
  function rtrim(s)
    local n = #s
    while n > 0 and s:find("^%s", n) do n = n - 1 end
    return s:sub(1, n)
  end

  local zsh_path = rtrim(vim.fn.system("which zsh"))
  local zsh_cmd = zsh_path .. " --login"

  return zsh_cmd
end

function __toggleterm__toggle(name)
  M.terminals[name]:toggle()
end

function __toggleterm__clear(name)
  M.terminals[name]:clear()
end

return M
