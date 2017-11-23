defmodule Validator do
  def valid(code, k, n) when n == k do
    String.at(code, n) != "0"
  end
  
  def valid(code, k, n) do
    String.at(code, n) == "0" && valid(code, k, n + 1)
  end
end