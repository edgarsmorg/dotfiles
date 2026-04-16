local dir= vim.fn.stdpath('config') .. '/lua/plugins'
local files = {}

for name, kind in vim.fs.dir(dir) do
  if kind == 'file' and name ~= 'init.lua' and name:sub(-4) == '.lua' then
    files[#files + 1] = name:sub(1, -5)
  end
end

table.sort(files)

for _, module in ipairs(files) do
  require('plugins.' .. module)
end
