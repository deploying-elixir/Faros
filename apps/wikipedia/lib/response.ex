defmodule Response do

  def convert({:ok, %HTTPoison.Response{body: body, status_code: status_code}}) do
    {:ok, json} = JSON.decode(body)
    tail = List.delete_at(json, 0)
    format(tail)
  end

  def convert({:error, %HTTPoison.Error{id: id, reason: reason} }) do
    IO.inspect "Error in http call"
  end

  defp format(response_details = [names, descriptions, links]) do
    IO.puts "separate"
    IO.inspect response_details
    grouped = group_details(response_details, [])
    IO.inspect grouped
    grouped
  end

  defp group_details(details = [[head_title|tail_title], [head_desc|tail_desc], [head_link | tail_link]], all_results) do
    new_res = all_results ++ [process_single_result(details, [])]
    group_details([tail_title, tail_desc, tail_link], new_res)
  end
  defp group_details([[], [], []], all_results) do
    all_results
  end

  defp process_single_result(details, single_result) do
    details
    |> Enum.map(fn([head | tail]) -> single_result ++ [head] end)
    |> List.flatten
    |> create_struct
  end

  defp create_struct(details = [title, description, link]) do
    IO.inspect details
    %Result{title: title, description: description, link: link}
  end
end

