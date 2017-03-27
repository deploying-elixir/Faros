defmodule FarosFrontend.SearchChannel do
  use Phoenix.Channel
  intercept ["new_search"]

  def join("search:results", _message, socket) do
    {:ok, socket}
  end

  def join("search:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_search", %{"body" => body}, socket) do
    broadcast!(socket, "new_search", %{body: body})
    {:noreply, socket}
  end

  def handle_out("new_search", payload, socket) do
    push(socket, "new_search", payload)
    {:noreply, socket}
  end
end
