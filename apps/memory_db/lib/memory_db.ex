defmodule MemoryDb do
  use GenServer

  def init do
    GenServer.start_link(__MODULE__, %{search: [], post: []}, name: Storage)
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

  def handle_call({:store_post, result}, _from, state = %{post: posts}) do
    updated_list = posts ++ [result]
    new_state = %{state | post: updated_list}

    {:reply, new_state, new_state}
  end

  def handle_call({:store_search, result}, _from, state = %{search: search}) do
    updated_list = search ++ [result]
    new_state = %{state | search: updated_list}

    {:reply, new_state, new_state}
  end

  def handle_call({:lookup_search, %{source: query_source}}, _from, %{search: state}) do
    results = Enum.filter(state, fn(element) ->
      element.source == query_source
    end)
    {:reply, results, results}
  end

  def handle_call({:lookup_post, %{type: :post}}, _from, %{post: state}) do
    {:reply, state, state}
  end
end
