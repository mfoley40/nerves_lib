defmodule Nerves.Lib.Mixfile do

  @version "0.1.1-dev"

  use Mix.Project

  def project do
    [app: :nerves_lib,
     version: @version,
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application, do: [
    applications: [],
    mod: {Nerves.Lib, []}
  ]

  defp deps do
    []
  end

end
