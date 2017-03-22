defmodule PostService do
  @moduledoc """
  Documentation for PostService.
  """

  @doc """
  Hello world.

  ## Examples

  iex> PostService.hello
  :world

  """
  def create(new_post) do
    IO.puts "NEW SERVICE:::::"
    IO.inspect(new_post)
  end
end
