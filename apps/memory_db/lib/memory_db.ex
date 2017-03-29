defmodule MemoryDb do
  use GenServer

  @moduledoc """
  MemoryDb is just an in memory storage mechanism using a GenServer to persist your data in memory.
  """

  @doc """
  Starts the MemoryDb process and returns the process id.

  ## The PID number below will likely be different on your machine.

      iex> MemoryDb.start_link
      {:ok, #PID<0.153.0>}
  """
  def start_link do
    state = %{}
    GenServer.start_link(__MODULE__, state, [name: __MODULE__])
  end

  @doc """
  Retrieves the results for the given key

  ## Examples
      iex> MemoryDb.lookup(:search, "pizza")
      iex> {"pizza", [%{description: "A pizza article"}]}

      iex> results = [%{description: "A pizza article"}]
      iex> MemoryDb.store("pizza", results)
      iex> :ok

      iex> MemoryDb.lookup(:search, "pizza")
      iex> {"pizza", [%{description: "A pizza article"}]}
  """
  @spec lookup(atom, String.t) :: {String.t, list(map)}
  def lookup(:search, topic) do
    GenServer.call(__MODULE__, {:lookup, topic})
  end

  @doc """
  Stores the given results using the topic as a key.
  If the key exists, it will update the existing record, otherwise it will create a new entry for that key.

  ## Examples

      iex> MemoryDb.lookup(:search, "pizza")
      iex> {"pizza", :not_found}

      iex> results = [%{description: "A pizza article"}]
      iex> MemoryDb.store("pizza", results)
      iex> :ok

      iex> MemoryDb.lookup(:search, "pizza")
      iex> {"pizza", [%{description: "A pizza article"}]}

      iex> new_results = [%{description: "Another pizza article"}]
      iex> MemoryDb.store("pizza", new_results)
      iex> :ok

      iex> MemoryDb.lookup(:search, "pizza")
      iex> {"pizza", [%{description: "A pizza article"}, %{description: "Another pizza article"}]}
  """
  @spec store(String.t, list(map)) :: none
  def store(topic, results) do
    GenServer.cast(__MODULE__, {:store, {topic, results}})
  end

  def handle_cast({:store, {topic, results}}, state) do
    new_state = Map.get(state, topic)
    |> create_or_update(topic, results, state)

    {:noreply, new_state}
  end

  def handle_call({:lookup, topic}, _from, state) do
    result = Map.fetch(state, topic)
    |> fetch_result

    {:reply, {topic, result}, state}
  end

  defp fetch_result({:ok, result}), do: result
  defp fetch_result(:error), do: :not_found

  defp create_or_update(records, topic, results, state) when is_list(records) do
    Map.update(state, topic, [], fn(s) -> s ++ results end)
  end
  defp create_or_update(nil, topic, results, state) do
    Map.put(state, topic, results)
  end
end
