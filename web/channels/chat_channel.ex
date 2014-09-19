defmodule DemoApp.ChatChannel do
  use Phoenix.Channel
	require Logger

  def join(socket, topic, message) do
		user = message["user"]
		Logger.debug "JOIN BY #{user}"
		reply socket, "join", %{content: "#{user} joined #{topic} successfully"}
    {:ok, socket}
  end

  def join(socket, _no, _message) do
		Logger.debug "JON NOT AUTHORIZED"
    {:error, socket, :unauthorized}
  end

end