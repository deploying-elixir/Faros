defmodule FarosFrontend.SearchView do
  use FarosFrontend.Web, :view

  def capitalize(term) do
    String.capitalize(term)
  end
end
