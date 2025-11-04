-- local function is_socket_active(filepath)
--   local f = io.open(filepath, "r") -- Attempt to open the file in read mode
--   if f then
--     io.close(f) -- Close the file if it was successfully opened
--     print("true here!!!")
-- 		return true
--   else
-- 		print("I'm returning false!!!")
--     return false
--   end
-- end
--

local function is_socket_active(socket_path)
	local ok, channel = pcall(vim.fn.sockconnect, "pipe", socket_path, {rpc = true})
	if ok and channel  then
		vim.fn.chanclose(channel)
		return true
	else
		return false
	end
end

local function get_next_socket(base_dir, socket_prefix)
	for counter = 0, 99 do
		local socket_path = string.format("%s/%s%d.sock", base_dir, socket_prefix, counter)
		if not is_socket_active(socket_path) then
			return socket_path
		end
	end
	error("No available sockets")
end

return get_next_socket

