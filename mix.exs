defmodule VROOM.MixProject do
  use Mix.Project

  def project do
    [
      app: :vroom,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.4"},
      {:jason, "~> 1.2"},
      {:mint, "~> 1.2"},
      {:castore, "~> 0.1.8"}
    ]
  end
end
