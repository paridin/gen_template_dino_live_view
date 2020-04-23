defmodule <%= @project_name_camel_case %>.MixProject do
  use Mix.Project

  def project do
    [
      app: :<%= @project_name %>,
      version: "<%= @project_version %>",
      elixir: "~> <%= @elixir_version %>",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      description: "My awesome project <%= @project_name %>.",
      package: package(),
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
      extra_applications: [:logger, :runtime_tools]
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
      {:phoenix, "~> 1.5"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_html, "~> 2.14"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.12"},
      {:phoenix_live_dashboard, "~> 0.1"},
      {:plug_cowboy, "~> 2.1"},
      {:gettext, "~> 0.17"},
      {:jason, "~> 1.1"},
      # dev & test apps
      {:sobelow, "~> 0.8", only: :dev},
      {:credo, "~> 1.2", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:floki, "~> 0.25.0", only: :test},
      {:excoveralls, "~> 0.10", only: :test}
    ]
  end
end
