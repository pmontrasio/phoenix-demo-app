use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, MyProject.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  cookies: true,
  session_key: "_my_project_key",
  session_secret: "4D5JB(FQM+@YEVCN0D#O$V%__R&N78G=^J$)_TE*L+7BLNLJUMTI&6Y6T6JML^%UPM&LN%67LW=*)S"

config :logger, :console,
  level: :info,
  metadata: [:request_id]

