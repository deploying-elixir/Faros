defmodule DbService do
  # TODO a test!
  def persist(service_name, data) do
IO.inspect data
IO.inspect "element is  #{data[:post_url]}"
IO.inspect "element is  #{data[:description]}"
    DbService.PostRepository.create(data[:post_url], data[:description])
  end
end
