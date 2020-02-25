defmodule <%= @project_name_camel_case %>Web.Router do
  use <%= @project_name_camel_case %>Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", <%= @project_name_camel_case %>Web do
    pipe_through :browser

    live("/", Live.Home)
    live("/top", Live.TopExample)
  end
end
