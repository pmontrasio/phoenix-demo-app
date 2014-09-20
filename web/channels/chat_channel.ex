defmodule DemoApp.ChatChannel do
  use Phoenix.Channel
	require Logger

	# Note: I'm not doing checks on the authentication state of the
	# users so this chat is public. This is probably not what you usually
	# want because anybody can write its own program to connect to the
	# public websocket of the chat and tap into it.

  def join(socket, topic, message) do
		user = message["user"]
		broadcast socket, "join", %{content: "#{user} joined #{topic}"}
    {:ok, socket}
  end

  def event(socket, "chat:message", message) do
		broadcast socket, "message", message
		socket
	end

end