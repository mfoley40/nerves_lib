defmodule Nerves.Lib.Mixfile do

  @version "1.0.0"

  use Mix.Project

  def project do
    [app: :nerves_lib,
     version: @version,
     elixir: "~> 1.11",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application, do: [
    applications: [:logger],
    mod: {Nerves.Lib, []}
  ]

  defp deps do
    []
  end

end
