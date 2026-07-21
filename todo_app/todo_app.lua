-- A Basic TODO app in Lua
-- Learn about Tables, arrays etc

-- Task functions

ID = 1 -- Task ID

local function add_task()
	print("Adding new task (ID: " .. ID .. ")")

	io.write("Enter Task Description: ")
	local description = io.read("*l")

	io.write("Task Complete (Choose option 1 or 2) ?\n")
	io.write("1. Yes\n2. No\n")
	io.write("\nEnter your Choice: ")

	local op = tonumber(io.read("*l"))

	local task = {
		id = ID,
		description = description,
		done = op == 1,
	}

	ID = ID + 1
	return task
end

local function delete_task(task_arr, task_id)
	for index, task in ipairs(task_arr) do
		if task.id == task_id then
			table.remove(task_arr, index)
		end
	end

	print("Task Not Found")
end

local function list_tasks(task_arr)
	for _, task in ipairs(task_arr) do
		print("ID: " .. task.id .. " | Description: " .. task.description .. " | Done: " .. tostring(task.done) .. "\n")
	end
end

-- Main function
local function main()
	print("===TODO List (Add, Delete, List tasks)==")
	local exit = false

	local todo_arr = {}

	while exit == false do
		print("Choose your option: ")
		print("1. Add new task")
		print("2. Delete task")
		print("3. List all tasks")
		print("4. Exit")

		io.write("\nEnter your Choice: ")
		local op = tonumber(io.read("*l"))
		io.write("\n")

		if op == 1 then
			local task = add_task()
			table.insert(todo_arr, task)
		elseif op == 2 then
			io.write("Enter task ID to remove: ")
			local id = tonumber(io.read("*l"))
			delete_task(todo_arr, id)
		elseif op == 3 then
			list_tasks(todo_arr)
		elseif op == 4 then
			exit = true
			break
		else
			print("Invalid Option")
		end
	end
end

main()
