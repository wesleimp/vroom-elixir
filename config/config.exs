use Mix.Config

config :tesla, adapter: Tesla.Adapter.Mint

config :vroom, url: "http://solver.vroom-project.org"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
