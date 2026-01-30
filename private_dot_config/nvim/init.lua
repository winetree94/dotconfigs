-- Bootstrap mini.deps
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.deps'

if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing mini.deps..." | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.deps', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.deps | helptags ALL')
  vim.cmd('echo "Done!" | redraw')
end

require('mini.deps').setup({ path = { package = path_package } })

-- Load base options and keymaps
require('config.options')

-- Load all plugins from lua/plugins/
local plugins_path = vim.fn.stdpath('config') .. '/lua/plugins'
for _, file in ipairs(vim.fn.readdir(plugins_path)) do
  if file:match('%.lua$') then
    local module_name = 'plugins.' .. file:gsub('%.lua$', '')
    require(module_name)
  end
end
