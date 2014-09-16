defmodule AuthenticationPlug do
	import Plug.Conn
	alias MyProject.User
	require Logger

	@behaviour Plug

	def init(options) do
		options
	end

	def call(conn, _opts) do
		user_id = get_session(conn, :user_id)
		unless user_id == nil do
			user = Repo.get(User, user_id)
			Plug.Conn.assign(conn, :current_user, user)
		else
			Plug.Conn.assign(conn, :current_user, nil)
		end
	end

end