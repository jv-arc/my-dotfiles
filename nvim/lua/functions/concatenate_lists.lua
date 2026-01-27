-- Todo: Check table dimensions

local function concatenate_lists( list_table )
	local new_list = {}

	for table_index, list in ipairs(list_table) do
		for list_index, item in ipairs(list_table[table_index]) do
			table.insert(new_list, list_table[table_index][list_index])
		end
	end

	return new_list
end


return concatenate_lists
