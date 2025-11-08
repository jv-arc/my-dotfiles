local function hexToChroma(hexColor)
	hexColor = hexColor:gsub("#", "")

	local r = tonumber(hexColor:sub(1, 2), 16)
	local g = tonumber(hexColor:sub(3, 4), 16)
	local b = tonumber(hexColor:sub(5, 6), 16)

	r = r / 255
	g = g / 255
	b = b / 255

	local function linearize(c)
		if c <= 0.04045 then
			return c / 12.92
		else
			return math.pow((c + 0.055) / 1.055, 2.4)
		end
	end

	r = linearize(r)
	g = linearize(g)
	b = linearize(b)

	local x = r * 0.4124564 + g * 0.3575761 + b * 0.1804375
	local y = r * 0.2126729 + g * 0.7151522 + b * 0.0721750
	local z = r * 0.0193339 + g * 0.1191920 + b * 0.9503041

	x = x / 0.95047
	y = y / 1.00000
	z = z / 1.08883

	local epsilon = 216 / 24389
	local kappa = 24389 / 27

	local function f(t)
		if t > epsilon then
			return math.pow(t, 1/3)
		else
			return (kappa * t + 16) / 116
		end
	end

	local fx = f(x)
	local fy = f(y)
	local fz = f(z)

	local L = 116 * fy - 16
	local a = 500 * (fx - fy)
	local b_lab = 200 * (fy - fz)

	local chroma = 2*math.sqrt(a * a + b_lab * b_lab)

	return chroma
end

return hexToChroma
