function string:split(split)
	local sections = {}

	for str in string.gmatch(self, "([^" .. split .. "]+)") do
		table.insert(sections, str)
	end

	return sections
end

function string:starts_with(start)
	return self:sub(1, #start) == start
end
