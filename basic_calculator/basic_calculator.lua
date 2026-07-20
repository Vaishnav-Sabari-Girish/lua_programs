-- A basic Calculator App
-- Learn functions, variables, loops, user input
-- strings etc

-- The main function
-- This is optional.
-- I want main for familiarity
local function main()
	print("Calculator app (Basic)")

	print("Enter the 2 numbers")
	local num1 = io.read("*n")
	local num2 = io.read("*n")

	print("Choose the operation:")
	print("1. +")
	print("2. -")
	print("3. *")
	print("4. /")
	print("5. %")
	print("Enter the number of the operator [1..5]: ")

	local op = io.read("*n")

	local choice = {
		[1] = function()
			return num1 + num2
		end,

		[2] = function()
			return num1 - num2
		end,
		[3] = function()
			return num1 * num2
		end,
		[4] = function()
			if num2 == 0 then
				print("Division by 0 is not possible")
				return 0
			else
				return num1 / num2
			end
		end,
		[5] = function()
			if num2 == 0 then
				print("Division by 0 is not possible")
				return 0
			else
				return num1 % num2
			end
		end,
	}

	print("You chose option ", op)

	if choice[op] then
		print("Output : ", choice[op]())
	else
		print("Invalid Output")
	end
end

-- call main()
main()
