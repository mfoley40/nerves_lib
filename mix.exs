defmodule Nerves.Lib.Mixfile do

  use Mix.Project

  def project do
    [app: :nerves_lib,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application, do: [
    applications: []
    mod: {Nerves.Lib, []}
  ]

  defp deps do
    []
  end

end
