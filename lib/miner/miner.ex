defmodule Miner do
  use Application
  require Logger
  # def print_multiple_times(msg) do
  #   IO.puts msg
  #   print_multiple_times(msg + 1)
  # end

  def bitcoinMatch(k) do
    if !is_integer(k) do
      k = String.to_integer(k)
    end
    n = 10
    group = Application.get_env(:elixir_server, :studentId, "10000000")
    x = group <> RandomBytes.base62(:rand.uniform(n))
    code = Encoder.encode(x)
    if Validator.valid(code, k, 0) do
      msg = x <> "  " <> code
      Logger.info msg
      # body = "coin=" <> code
      # HTTPoison.post("localhost:8080/upload", body, %{"Content-type" => "application/x-www-form-urlencoded"})
      # listen(msg)
      # receive do
      #   # a = IO.puts x <> "  " <> code
      #   {:hello, from} -> send(from, {:hi, msg})
      # end
      
    end
    bitcoinMatch(k)
  end

  # def listen(msg) do
  #   receive do
  #       # a = IO.puts x <> "  " <> code
  #       {:hello, from} -> send(from, {:hi, msg})
  #   end

  #   listen(msg)
  # end

end
