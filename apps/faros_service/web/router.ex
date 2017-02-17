defmodule FarosService.Router do
  use FarosService.Web, :router

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

  scope "/", FarosService do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/post", PostController, :new # allow user to add new post
    post "/post", PostController, :create # when user clicks 'add' button this gets called
  end

   scope "/api", FarosService do
     pipe_through :api
   end
end
