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
		conn = Plug.Conn.assign(conn, :current_user, nil)
		unless user_id == nil do
			user = Repo.get(User, user_id)
			unless user == nil do
				conn = Plug.Conn.assign(conn, :current_user, user)
			end
		end
		conn
	end

end