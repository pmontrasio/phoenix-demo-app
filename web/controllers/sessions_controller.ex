defmodule MyProject.SessionsController do
  use Phoenix.Controller
	require Logger

	# shorthand for alias MyProject.Router, as: Router
	alias MyProject.Router # So we can just write Router.
	alias MyProject.User

  def new(conn, _params) do
    render conn, "new"
  end

	# This will work only if it receives user[email] and user[password]
	# If one of them is missing we'll get an error
	# (FunctionClauseError) no function clause matching in MyProject.SessionsController.create/2
  def create(conn, _params) do
		%{ "user" => %{ "email" => email, "password" => password }} = _params
		case User.find(email, password) do
			[user] ->
				Logger.debug "EMAIL #{user.email}"
				Logger.debug "PASS #{user.password}"
			[] ->
				IO.puts "sorry"
		end

		#query = from user in User,
		#  where: user.email == email and user.password == encrypted_password,
		#		select: user
		#[user] = Repo.all(query)

		# if user with email and encrypted_password exists
		#   put_session(conn, :user_id, user.id)
		# end
    redirect conn, Router.pages_path(:index)
  end

  def destroy(conn, _params) do
		delete_session(conn, :user_id)
    redirect conn, Router.pages_path(:index)
  end
end
