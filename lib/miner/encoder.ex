defmodule Encoder do
  def encode(x) do
    Base.encode16(:crypto.hash(:sha256, x))
  end
end