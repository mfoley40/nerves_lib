use Mix.Config

config :logger, :console,
  level: :info,
  metadata: [:module, :file, :line]
