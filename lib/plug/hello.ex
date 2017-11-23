defmodule Hello do
	def sayHello() do
		# n = String.to_integer(param) + 1
		IO.puts "aaaaaaaaa"
		receive do
			{:hello, from} -> send(from, {:hi, "world"})
		end
		# IO.puts "this param is " <> param
	end
end