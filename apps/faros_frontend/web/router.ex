defmodule FarosFrontend.Router do
  use FarosFrontend.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FarosFrontend do
    pipe_through :browser

    get "/", PageController, :index
    get "/post", PostController, :new
    post "/post", PostController, :create
    get "/all_posts", PostController, :show_all
    get "/search", SearchController, :index
    post "/search", SearchController, :search
  end
end
