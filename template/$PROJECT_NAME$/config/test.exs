import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :<%= @project_name %>, <%= @project_name_camel_case %>Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :<%= @project_name %>, <%= @project_name_camel_case %>Web.Endpoint,
  server: true

# phoenix_ecto depends on this flag, that's why wallaby needs it to run tests with ecto integration.
config :<%= @project_name %>, :sql_sandbox, false

config :git_hooks,
  auto_install: true,
  verbose: true,
  hooks: [
    pre_commit: [
      tasks: [
        {:cmd, "mix credo --strict"},
        {:cmd, "mix compile --force --warnings-as-errors"}
      ]
    ],
    pre_push: [
      verbose: false,
      tasks: [
        {:cmd, "bash ci.sh"},
        {:cmd, "echo 'success!'"}
      ]
    ]
  ]
