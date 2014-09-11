use Mix.Config

config :phoenix, MyProject.Router,
  port: System.get_env("PORT") || 4001,
  ssl: false,
  cookies: true,
  session_key: "_my_project_key",
  session_secret: "4D5JB(FQM+@YEVCN0D#O$V%__R&N78G=^J$)_TE*L+7BLNLJUMTI&6Y6T6JML^%UPM&LN%67LW=*)S"

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


