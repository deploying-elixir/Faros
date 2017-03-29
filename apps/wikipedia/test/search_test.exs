defmodule SearchTest do
  use ExUnit.Case

  test "result returned from wikipedia search" do
    results = Search.for_topic(%{topic: "olympics", amount: 5})
    assert length(results) == 5
  end
end
