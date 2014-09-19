use Mix.Config

config :phoenix, DemoApp.Router,
  port: System.get_env("PORT") || 4000,
  ssl: false,
  host: "localhost",
  cookies: true,
  session_key: "_demo_app_key",
  session_secret: "4D5JB(FQM+@YEVCN0D#O$V%__R&N78G=^J$)_TE*L+7BLNLJUMTI&6Y6T6JML^%UPM&LN%67LW=*)S",
  debug_errors: true

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug
