defmodule DemoApp.SessionsController do
  use Phoenix.Controller
	require Logger

	# shorthand for alias DemoApp.Router, as: Router
	alias DemoApp.Router # So we can just write Router.
	alias DemoApp.User

  def new(conn, _params) do
    render conn, "new"
  end

	# This will work only if it receives user[email] and user[password]
	# If one of them is missing we'll get an error
	# (FunctionClauseError) no function clause matching in DemoApp.SessionsController.create/2
  def create(conn, _params) do
		%{ "user" => %{ "email" => email, "password" => password }} = _params
		case User.find(email, password) do
			[user] ->
				Logger.debug "EMAIL #{user.email} #{user.id} logged in"
				if user.admin do
					path = Router.admin_users_path(:show, user.id)
				else
					path = Router.users_path(:show, user.id)
				end
				fetch_session(conn)
				|> put_session(:user_id, user.id)
				|> Flash.put(:notice, "Login successful")
				|> redirect path
			[] ->
				Logger.debug "LOGIN FAILED"
				fetch_session(conn)
				|> put_session(:login_as, email)
				|> Flash.put(:alert, "Login failed")
				|> redirect Router.sessions_path(:new)
		end
  end

  def destroy(conn, _params) do
		Logger.debug "LOGOUT"
		fetch_session(conn)
		|> delete_session(:user_id)
		|> Flash.put(:notice, "Logout successful")
    |> redirect Router.pages_path(:index)
  end
end
