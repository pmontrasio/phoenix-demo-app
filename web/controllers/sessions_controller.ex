defmodule MyProject.SessionsController do
  use Phoenix.Controller
	alias MyProject.Router # So we can just write Router.
	require Logger

  def new(conn, _params) do
    render conn, "new"
  end

	# This will work only if it receives user[email] and user[password]
	# If one of them is missing we'll get an error
	# (FunctionClauseError) no function clause matching in MyProject.SessionsController.create/2
  def create(conn, _params) do
		%{ "user" => %{ "email" => email, "password" => password }} = _params
		encrypted_password = :base64.encode(:crypto.hash(:sha256, password))
		Logger.debug "EMAIL #{email}, PASSWORD #{password}, ENCRYPTED #{encrypted_password}"

    redirect conn, Router.pages_path(:index)
  end

  def destroy(conn, _params) do
    render conn, "destroy"
  end
end
