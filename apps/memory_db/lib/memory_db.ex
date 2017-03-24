defmodule MemoryDb do
  use GenServer

  def start_link do
    state = %{search: [], post: []}
    GenServer.start_link(__MODULE__, state, [name: Storage])
  end

  def store(result = %{type: :search}) do
    GenServer.call(Storage, {:store_search, result})
  end

  def store(result = %{type: :post}) do
    GenServer.call(Storage, {:store_post, result})
  end

  def lookup(query = %{type: :search}) do
    GenServer.call(Storage, {:lookup_search, query})
  end

  def lookup(query = %{type: :post}) do
    GenServer.call(Storage, {:lookup_post, query})
  end

  def handle_call({:store_post, result}, _from, state) do
    updated_list = state.post ++ [result]
    new_state = %{state | post: updated_list}

    {:reply, new_state, new_state}
  end

  def handle_call({:store_search, result}, _from, state) do
    updated_list = state.search ++ [result]
    new_state = %{state | search: updated_list}

    {:reply, new_state, new_state}
  end

  def handle_call({:lookup_search, %{type: :search, source: query_source}}, _from, state) do
    results = Enum.filter(state.search, fn(element) ->
      element.source == query_source
    end)
    {:reply, results, state}
  end

  def handle_call({:lookup_post, %{type: :post}}, _from, state) do
    {:reply, state.post, state}
  end
end