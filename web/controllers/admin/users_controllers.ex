defmodule DemoApp.Admin.UsersController do
  use Phoenix.Controller
	require Logger
	alias DemoApp.User
	require Authentication
	require AdminsOnly

	plug Authentication
	plug AdminsOnly

  def show(conn, _params) do
		%{ "id" => user_id } = _params
		{ user_id, _ } = Integer.parse(user_id) # omitted checks on error
		user = Repo.get(User, user_id)          # omitted checks on user not found
		                                        # left as exercises
    render conn, "show", user: user
  end
end
