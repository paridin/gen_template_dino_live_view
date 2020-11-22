import Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.
config :<%= @project_name %>, <%= @project_name_camel_case %>Web.Endpoint,
  http: [port: 4000],
  https: [
    # if you are on linux be sure your user has permission on 443. (windows user please give me feedback.)
    # otherwise you can set HTTPS_PORT on your profile `.bash_profile`, `.zsh_profile` etc.
    # example:
    # export HTTPS_PORT=4443
    # then run. another way is during the execution
    # HTTPS_PORT=4443 mix phx.server
    port: String.to_integer(System.get_env("HTTPS_PORT", "4001")),
    otp_app: :<%= @project_name %>,
    certfile: System.get_env("HTTPS_CERT_FILE") || "priv/ssl/<%= @project_name %>.pem",
    keyfile: System.get_env("HTTPS_KEY_FILE") || "priv/ssl/<%= @project_name %>_key.pem"
  ],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

# Watch static and templates for browser reloading.
config :<%= @project_name %>, <%= @project_name_camel_case %>Web.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/<%= @project_name %>_web/(live|views)/.*(ex)$",
      ~r"lib/<%= @project_name %>_web/templates/.*(eex)$"
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
