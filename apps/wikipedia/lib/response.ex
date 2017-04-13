defmodule Response do

  def convert({:ok, %HTTPoison.Response{body: body, status_code: status_code}}) do
    body
    |> JSON.decode!
    |> List.delete_at(0)
    |>format
  end

  def convert({:error, %HTTPoison.Error{id: id, reason: reason} }) do
    IO.inspect "Error in http call"
  end

  defp format(response_details = [names, descriptions, links]) do
    response_details
    |> Enum.zip
    |> Enum.map(fn(x) -> create_struct(x) end)
  end

  defp create_struct(details = {title, description, link}) do
    %Result{title: title, description: description, link: link, source: 'wikipedia'}
  end
end

