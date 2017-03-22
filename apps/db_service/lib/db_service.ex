defmodule DbService do
  # TODO a test!
  def persist(service_name, data) do
    DbService.PostRepository.create(data[:post_url], data[:description])
  end

  def all() do
    DbService.PostRepository.all()
  end
end
