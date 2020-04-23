defmodule <%= @project_name_camel_case %>.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Telemetry supervisor
      <%= @project_name_camel_case %>Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: <%= @project_name_camel_case %>.PubSub},
      # Start the Endpoint (http/https)
      <%= @project_name_camel_case %>Web.Endpoint
      # Starts a worker by calling: <%= @project_name_camel_case %>.Worker.start_link(arg)
      # {<%= @project_name_camel_case %>.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: <%= @project_name_camel_case %>.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    <%= @project_name_camel_case %>Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
