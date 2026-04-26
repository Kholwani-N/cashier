defmodule Cashier.MixProject do
  use Mix.Project

  def project do
    [
      app: :cashier,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Cashier.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:decimal, "~> 2.1"},
      {:jason, "~> 1.4", only: [:dev, :test]},
      {:uuid, "~> 1.1", hex: :uuid}
    ]
  end
end
