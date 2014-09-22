defmodule DemoApp.ChatChannel do
  use Phoenix.Channel
	import Plug.Conn
	require Logger
	alias DemoApp.User

	# User authentication on websockets is the subject of this issue
	# https://github.com/phoenixframework/phoenix/issues/218

  def join(socket, topic, message) do
		#Logger.debug "JOIN?"
		user = get_user(socket)
		if user == nil do
			{:error, socket, "Not logged in"}
		else
			#Logger.debug "JOIN #{user.email}"
			broadcast socket, "join", %{content: "#{user.email} joined the chat"}
			{:ok, socket}
		end
	end

  def event(socket, "chat:message", message) do
		user = get_user(socket)
		unless user == nil do
			#Logger.debug "MESSAGE #{user.email}: #{message["message"]}"
			broadcast socket, "message", message
		end
		socket
	end

	# This is called both when the JavaScript sends a "leave" event
	# and when the page with the websocket is closed.
	def leave(socket, topic) do
		#Logger.debug "LEAVE"
		user = get_user(socket)
		unless user == nil do
			broadcast socket, "user:left", %{ "content" => "#{user.email} left the chat" }
		end
		socket
	end

	defp get_user(socket) do
		{:ok, %{user_id: user_id}} = get_session(socket) # TODO handle error conditions
		unless user_id == nil do
			Repo.get(User, user_id)
		else
			nil
		end
	end

	defp get_session(socket) do
		session_key = Phoenix.Config.router(DemoApp.Router)[:session_key]
		session_secret = Phoenix.Config.router(DemoApp.Router)[:session_secret]
		cookies = List.keyfind(elem(socket.conn, 16), "cookie", 0)	|> elem(1)
	  session_store = Plug.Conn.Cookies.decode(cookies)[session_key]
		Plug.MessageVerifier.verify(session_secret, session_store)
	end

end