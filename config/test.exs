import Config

config :phoenix, :logger, false
config :plug, :logger, false

config :logger,
  level: :warning,
  compile_time_purge_matching: [
    [level_lower_than: :warning]
  ]