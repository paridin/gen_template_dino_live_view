defmodule <%= @project_name_camel_case %>Web.Router do
  use <%= @project_name_camel_case %>Web, :router
  import Plug.BasicAuth
  import Phoenix.LiveDashboard.Router

  pipeline :admins_only do
    plug :basic_auth, username: "<%= @basic_auth_user %>", password: "<%= @basic_auth_password %>"
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {<%= @project_name_camel_case %>Web.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", <%= @project_name_camel_case %>Web do
    pipe_through :browser

    live("/", Live.Home)
    live("/example", Live.WeatherExample)
  end

  scope "/" do
    pipe_through [:browser, :admins_only]
    live_dashboard "/dashboard", metrics: <%= @project_name_camel_case %>Web.Telemetry
  end
end
