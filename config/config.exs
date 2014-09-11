# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, MyProject.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_my_project_key",
  session_secret: "4D5JB(FQM+@YEVCN0D#O$V%__R&N78G=^J$)_TE*L+7BLNLJUMTI&6Y6T6JML^%UPM&LN%67LW=*)S",
  catch_errors: true,
  debug_errors: false,
  error_controller: MyProject.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
