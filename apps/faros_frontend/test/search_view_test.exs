defmodule FarosFrontend.SearchViewTest do
  use FarosFrontend.ConnCase, async: true

  test "term is capatilized for display purposes" do
    formatted_term = FarosFrontend.SearchView.capitalize("pizza")

    assert formatted_term == "Pizza"
  end
end
