defmodule GenTemplateDino.Mixfile do
  use Mix.Project

  @name :gen_template_dino
  @version "0.1.6"

  @deps [
    {:mix_templates, ">0.0.0", app: false},
    {:ex_doc, ">0.0.0", only: [:dev, :test]}
  ]

  @maintainers ["Roberto Estrada <dev@paridin.com>"]
  @github "https://github.com/paridin/#{@name}"

  @description """
  This template is focus on create an app using ecto & phoenix 1.5.
  """

  # ------------------------------------------------------------

  def project do
    in_production = Mix.env() == :prod

    [
      app: @name,
      version: @version,
      deps: @deps,
      elixir: "~> 1.10",
      package: package(),
      description: @description,
      build_embedded: in_production,
      start_permanent: in_production
    ]
  end

  defp package do
    [
      name: @name,
      files: ["lib", "mix.exs", "README.md", "LICENSE.md", "template"],
      maintainers: @maintainers,
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => @github
      }
      # extra:       %{ "type" => "a_template_for_mix_gen" },
    ]
  end
end
