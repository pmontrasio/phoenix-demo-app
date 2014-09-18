defmodule MyProject.UsersController do
  use Phoenix.Controller
	require Logger
	alias MyProject.User
	require AuthenticationPlug

	plug AuthenticationPlug

  def show(conn, _params) do
		%{ "id" => user_id } = _params
		{ user_id, _ } = Integer.parse(user_id) # omitted checks on error
		user = Repo.get(User, user_id)          # omitted checks on user not found
    render conn, "show", user: user
  end
end
