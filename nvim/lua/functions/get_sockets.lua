local function is_socket_active(socket_path)
	local ok, channel = pcall(vim.fn.sockconnect, "pipe", socket_path, {rpc = true})
	if ok and channel  then
		vim.fn.chanclose(channel)
		return true
	else
		return false
	end
end

local function get_next_socket(socket_prefix, base_dir)
	local base_dir = (base_dir == nil) and os.getenv("XDG_RUNTIME_DIR") or base_dir
	for counter = 0, 99 do
		local socket_path = string.format("%s/%s%d.sock", base_dir, socket_prefix, counter)
		if not is_socket_active(socket_path) then
			return socket_path
		end
	end
	error("No available sockets")
end

return get_next_socket

