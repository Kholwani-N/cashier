import Config

config :logger,
  backends: [:console, {LoggerFileBackend, :file}]

config :logger, :file,
  path: "log/request.log",
  level: :info,
  format: "$time [$level] $message $metadata\n"