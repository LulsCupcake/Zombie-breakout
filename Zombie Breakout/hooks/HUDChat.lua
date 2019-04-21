if not SystemFS:exists("mods/WolfHUD-master/mod.txt") then
function HUDChat:_layout_output_panel()
	local output_panel = self._panel:child("output_panel")

	output_panel:set_w(self._output_width)

	local line_height = HUDChat.line_height
	local lines = 0

	for i = #self._lines, 1, -1 do
		local line = self._lines[i][1]
		local icon = self._lines[i][2]

		line:set_w(output_panel:w() - line:left())

		local _, _, w, h = line:text_rect()

		line:set_h(h)

		lines = lines + line:number_of_lines()
	end

	output_panel:set_h(line_height * math.min(6, lines))

	local y = 0

	for i = #self._lines, 1, -1 do
		local line = self._lines[i][1]
		local icon = self._lines[i][2]
		local _, _, w, h = line:text_rect()

		line:set_bottom(output_panel:h() - y)

		if icon then
			icon:set_top(line:top() + 1)
		end

		y = y + h
	end

	output_panel:set_bottom(self._input_panel:top())
end
end