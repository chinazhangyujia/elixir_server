defmodule MyApp.CLI do
  require Logger
  	def main(args) do
      core = Application.get_env(:elixir_server, :core_num, 8)
    	Logger.info "Hello from MyApp!"
    	args |> run(core)
  	end
  # defp parse_args(args) do
  #   parse = OptionParser.parse(args, switches: [k: :Integer])
  # end
  defp run(args, n) when n > 0 do
    # Miner.bitcoinMatch(String.to_integer(Enum.at(args, 0)))
    # pid = spawn(Hello, :sayHello, [])
    # send(pid, {:hello, self()})
    # receive do
    #   {:hi, msg} -> IO.puts msg
    # end
    spawn(Miner, :bitcoinMatch, args)
    # send(pid1, {:hello, self()})
    # receive do
    #   {:hi, msg} -> IO.puts msg
    # end
    run(args, n - 1)

    # pid2 = spawn(Miner, :bitcoinMatch, [args])
  end

  defp run(args, n) do
    :timer.sleep 20000
    run(args, n)
  end


  # defp listen() do
  #   receive do
  #     {:hi, msg} -> IO.puts msg
  #   end
  #   listen()
  # end

end