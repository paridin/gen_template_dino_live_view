defmodule <%= @project_name_camel_case %>.MixProject do
  use Mix.Project

  def project do
    [
      app: :<%= @project_name %>,
      version: "<%= @project_version %>",
      elixir: "~> <%= @elixir_version |> String.slice(0..3) %>",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      description: "My awesome project <%= @project_name %>.",
      package: package(),
      aliases: aliases(),
      # ExDoc
      name: "<%= @project_name %>",
      source_url: "https://github.com/<%= System.get_env("USER") %>/<%= @project_name %>",
      homepage_url: "https://<%= @project_name %>.com",
      docs: [
        main: "<%= @project_name %>",
        extras: ["README.md"]
      ],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      deps: deps(),
      releases: [
        <%= @project_name %>: [
          include_executables_for: [:unix],
          applications: [runtime_tools: :permanent],
          steps: [:assemble, :tar]
        ]
      ]
    ]
  end

  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{}
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {<%= @project_name_camel_case %>.Application, []},
      extra_applications: [:logger, :runtime_tools, :inets, :os_mon]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.2"},
      {:phoenix, "~> 1.5"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_html, "~> 2.14"},
      {:phoenix_live_view, "~> 0.15"},
      {:phoenix_live_dashboard, "~> 0.4"},
      {:plug_cowboy, "~> 2.2"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 0.5"},
      # The following requieres postgres you should use dino template instead.
      # {:ecto_psql_extras, "~> 0.6"},
      # {:libcluster, "~> 3.2"}
      # prod debug
      {:recon, "~> 2.5"},
      # dev & test apps
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      # {:dino_tasks, github: "paridin/dino_tasks", only: :dev},
      {:ex_doc, "~> 0.23", only: :dev, runtime: false},
      # {:ex_machina, "~> 2.4", only: :test},
      {:excoveralls, "~> 0.13", only: :test},
      {:exvcr, "~> 0.12", only: [:dev, :test]},
      {:floki, ">= 0.0.0", only: :test},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
      {:phoenix_live_reload, "~> 1.3", only: :dev},
      {:sobelow, "~> 0.10", only: [:dev, :test]},
      {:git_hooks, "~> 0.6.0", only: [:test, :dev], runtime: false},
      # search for wallaby to find tips if ecto is enabled.
      {:wallaby, "~> 0.26", [runtime: false, only: :test]}
    ]
  end

  defp aliases, do: [
    test: [
      "assets.compile --quiet",
      "test",
    ],
    "assets.compile": &compile_assets/1
  ]

  defp compile_assets(_) do
    Mix.shell().cmd("cd assets && ./node_modules/.bin/webpack --mode development",
      quiet: true
    )
  end
end
