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
		Plug.Conn.assign(conn, :current_user, nil)
		Logger.debug "user_id #{user_id} ??????????????"
		unless user_id == nil do
			user = Repo.get(User, user_id)
			unless user == nil do
				Logger.debug "OKKKKKKKKK"
				Plug.Conn.assign(conn, :current_user, user)
			end
		end
		conn
	end

end