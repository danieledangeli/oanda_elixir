defmodule OandaApi.Mixfile do
  use Mix.Project

  def project do
    [app: :oanda_api,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end


  defp deps do
    [ {:httpoison, "~> 0.9"}, {:poison, "~> 3.0"} ]
  end

  defp description do
    """
    Oanda Elixir client wrapper
    """
  end

  defp package do
    [# These are the default files included in the package
     name: :postgrex,
     files: ["lib", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     maintainers: ["Daniele D'Angeli"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/danieledangeli/oanda_elixir",
              "Docs" => "https://github.com/danieledangeli/oanda_elixir"}]
  end
end
