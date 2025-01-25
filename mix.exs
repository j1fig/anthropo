defmodule Anthropo.MixProject do
  use Mix.Project

  def project do
    [
      app: :anthropo,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Anthropo",
      source_url: "https://github.com/j1fig/anthropo",
      description: description(),
      package: package(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.36.1", only: :dev, runtime: false}
    ]
  end

  defp description do
    "An assortment of input-humanizing utility functions."
  end

  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/j1fig/anthropo"}
    ]
  end
end
