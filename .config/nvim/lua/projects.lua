local user = vim.fn.system({ 'whoami' }):sub(1, -2)
local userPath = '/home/' .. user

local R = vim.env.R:gsub('~', userPath)

local pattern = '^' .. R .. '/'

function setRoot()
	local i, j = vim.fn.getcwd():find(pattern)
	if i == 1 then
		local baseDir = split(vim.fn.getcwd():gsub(pattern, '', 1), '/')[1]
		local projectDir = R .. '/' .. baseDir
		local initPath = projectDir .. '/.vim/init.lua'

		vim.fn.chdir(projectDir)
		print('cd ' .. projectDir)

		if package.path:find(initPath) == nil then
			package.path = package.path .. ';' .. initPath
		end

		local status, err = pcall(function () require(initPath) end)
		if (status) then
			print('load ' .. initPath)
		end
	end
end

vim.api.nvim_create_user_command('Root', setRoot, {})
