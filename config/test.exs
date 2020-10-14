use Mix.Config

config :logger, :console,
  level: :debug,
  metadata: [:module, :file, :line]
