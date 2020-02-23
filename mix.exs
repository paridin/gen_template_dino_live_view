defmodule GenTemplateDinoLiveView.Mixfile do
  use Mix.Project

  @name    :gen_template_dino_live_view
  @version "0.1.7"

  @deps [
    { :mix_templates,  ">0.0.0",  app: false },
    { :ex_doc,         ">0.0.0",  only: [:dev, :test] },
  ]

  @maintainers ["Roberto Estrada <dev@paridin.com>"]
  @github      "https://github.com/paridin/#{@name}"

  @description """
  An opinionated template to create phoenix apps, using live view and tailwind.
  """

  # ------------------------------------------------------------

  def project do
    in_production = Mix.env == :prod
    [
      app:     @name,
      version: @version,
      deps:    @deps,
      elixir:  "~> 1.9",
      package: package(),
      description:     @description,
      build_embedded:  in_production,
      start_permanent: in_production,
    ]
  end

  defp package do
    [
      name:        @name,
      files:       ["lib", "mix.exs", "README.md", "LICENSE.md", "template", "base"],
      maintainers: @maintainers,
      licenses:    ["Apache 2.0"],
      links:       %{
        "GitHub" => @github,
      }
    ]
  end

end
