local function set_hl_multiple(groups, value)
	for _, v in pairs(groups) do
		vim.api.nvim_set_hl(0, v, value)
	end
end


return set_hl_multiple
