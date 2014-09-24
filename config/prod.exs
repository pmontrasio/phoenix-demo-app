use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, DemoApp.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: System.get_env("HOST"),
  cookies: true,
  session_key: "_demo_app_key",
  session_secret: System.get_env("SESSION_SECRET")

config :logger, :console,
  level: :info,
  metadata: [:request_id]
