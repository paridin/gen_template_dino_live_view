defmodule <%= @project_name_camel_case %>Web.Endpoint do
  use Phoenix.Endpoint, otp_app: :<%= @project_name %>

  @session_options [
    store: :cookie,
    key: "_<%= @project_name %>_key",
    signing_salt: "<%= @signing_salt_session %>"
  ]

  if Mix.env == :prod do
    plug(Plug.SSL,
      rewrite_on: [:x_forwarded_proto],
      secure_renegotiate: true,
      reuse_sessions: true,
      versions: [:"tlsv1.2"],
      hsts: true)
  end

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]]

  socket "/socket", <%= @project_name_camel_case %>Web.UserSocket,
    websocket: true,
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :<%= @project_name %>,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session, @session_options

  plug <%= @project_name_camel_case %>Web.Router
end
