defmodule AdminsOnly do
	import Plug.Conn
	require Logger
	alias Phoenix.Controller.Flash

	@behaviour Plug

	def init(options) do
		options
	end

	def call(conn, _opts) do
		current_user = conn.assigns.current_user
		unless current_user && current_user.admin do
			conn
			|> put_resp_header("Location", "/")
			|> resp(302, "")
			|> Flash.put(:alert, "Only admins can access that page")
			|> send_resp
		end
		conn
	end

end