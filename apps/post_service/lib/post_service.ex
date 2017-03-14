defmodule PostService do
  @moduledoc """
  Documentation for PostService.
  """

  def create(new_post) do
    # Persist post to database with an id
    IO.puts "NEW SERVICE:::::::"
    IO.inspect(new_post)
  end
end
