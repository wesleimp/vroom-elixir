use Mix.Config

config :tesla, adapter: Tesla.Adapter.Mint

config :vroom, VROOM.Request,
  url: "http://osrm-vroom.deliverycenter.io",
  timeout: 15000

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
