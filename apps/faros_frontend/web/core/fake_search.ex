defmodule Core.FakeSearch do
  def execute(_query) do
    [
      %Result{title: "a-title", description: "a-description", link: "test-link", source: "a-source"}
    ]
  end
end
