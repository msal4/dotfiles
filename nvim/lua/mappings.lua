local function file_exists(filepath)
	local f = io.open(filepath)
	if f ~= nil then io.close(f) return true else return false end
end

local function change_file(filepath, msg)
	vim.cmd("e " .. filepath)
	print(msg .. ": " .. filepath)
end

local function switch_between_header_and_source_file() 
	local filepath = vim.api.nvim_buf_get_name(0)
	local extension = filepath:match("(%.[^/]*)");
	if extension == nil then 
		print("The current buffer has no extension")
		return
	end

	if extension == ".c" or extension == ".cpp" or extension == ".cc" then
		local header_path = filepath:gsub(extension .. "$", ".h")
		if file_exists(header_path) then
			change_file(header_path, "Umschalten auf Headerdatei")
			return
		end
		local header_path = filepath:gsub(extension .. "$", ".hpp")
		if file_exists(header_path) then
			change_file(header_path, "Umschalten auf Headerdatei")
			return
		end
		print("Keine Headerdatei")
	elseif extension == ".h" or extension == ".hpp" then
		local source_path = filepath:gsub(extension .. "$", ".c")
		if file_exists(source_path) then
			change_file(source_path, "Umschalten auf Quelldatei")
			return
		end
		local source_path = filepath:gsub(extension .. "$", ".cpp")
		if file_exists(source_path) then
			change_file(source_path, "Umschalten auf Quelldatei")
			return
		end
		local source_path = filepath:gsub(extension .. "$", ".cc")
		if file_exists(source_path) then
			change_file(source_path, "Umschalten auf Quelldatei")
			return
		end
		print("Keine Quelldatei")
	else print("Keine C/CPP-Quelldatei oder C/CPP-Headerdatei " .. extension)
	end
end

vim.keymap.set("n", "<leader>k", switch_between_header_and_source_file)

vim.keymap.set("n", "<leader><space>", ":nohl<CR>")

vim.keymap.set("n", "<leader>xd", ":%!xxd<CR>")
vim.keymap.set("n", "<leader>xr", ":%!xxd -r<CR>")
