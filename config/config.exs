use Mix.Config

config :vroom,
  url: "http://solver.vroom-project.org",
  timeout: 15000

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
