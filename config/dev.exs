import Config

config :logger,
  level: :info,
  backends: [{LoggerFileBackend, :file}]

config :logger, :file,
  path: "log/dev.log",
  level: :info,
  format: "$time [$level] $message $metadata\n"