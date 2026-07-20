-- Normal calculator
-- Learn strings and iterating through strings

local function is_numeric(x)
	if tonumber(x, 10) ~= nil then
		return true
	end
	return false
end

local function is_operator(x)
	local op_arr = {
		"+",
		"-",
		"*",
		"/",
		"%",
	}

	for i = 1, #op_arr do
		if x == op_arr[i] then
			return true
		end
	end
	return false
end

local function main()
	print("=== CALCULATOR ===")

	-- Logic will be as follows
	-- 1. Enter a sequence
	-- 2. Loop though it and separate the numbers and the operators
	-- 3. To get full numbers we will loop though the digits and build it using string concatenation
	-- 4. Then push it to sequence array and evaluate
	local num = ""
	local seq_arr = {}

	local seq = io.read()

	for i = 1, #seq do
		local c = seq:sub(i, i)
		if is_numeric(c) then
			num = num .. c
		elseif c == " " then
			-- Do nothing
		elseif is_operator(c) then
			seq_arr[#seq_arr + 1] = num
			seq_arr[#seq_arr + 1] = c
			num = ""
		end
	end

	if num ~= "" then
		seq_arr[#seq_arr + 1] = num
	end

	-- print(table.concat(seq_arr, " "))
	--
	-- To evaluate, we will be using the Shunting-Yard Algorithm or Reverse Polish Notation (RPN)
	local stack = {}
	local output = {}

	local precedence = {
		["+"] = 1,
		["-"] = 1,
		["*"] = 2,
		["/"] = 2,
		["%"] = 2,
	}

	for i = 1, #seq_arr do
		local token = seq_arr[i]

		if is_numeric(token) then
			output[#output + 1] = token
		elseif is_operator(token) then
			while #stack > 0 do
				local top = stack[#stack]

				if precedence[top] >= precedence[token] then
					output[#output + 1] = table.remove(stack)
				else
					break
				end
			end

			stack[#stack + 1] = token
		end
	end

	while #stack > 0 do
		output[#output + 1] = table.remove(stack)
	end

	-- print("RPN: ")
	-- print(table.concat(output, " "))

	-- Evaluate the RPN expression
	local eval_stack = {}

	for i = 1, #output do
		local token = output[i]

		if is_numeric(token) then
			eval_stack[#eval_stack + 1] = tonumber(token)
		else
			local rhs = table.remove(eval_stack)
			local lhs = table.remove(eval_stack)

			if token == "+" then
				eval_stack[#eval_stack + 1] = lhs + rhs
			elseif token == "-" then
				eval_stack[#eval_stack + 1] = lhs - rhs
			elseif token == "*" then
				eval_stack[#eval_stack + 1] = lhs * rhs
			elseif token == "/" then
				eval_stack[#eval_stack + 1] = lhs / rhs
			elseif token == "%" then
				eval_stack[#eval_stack + 1] = lhs % rhs
			end
		end
	end

	print("Answer: ", eval_stack[1])
end

main()
