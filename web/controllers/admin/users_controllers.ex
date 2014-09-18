defmodule MyProject.Admin.UsersController do
  use Phoenix.Controller
	require Logger
	require AuthenticationPlug

	plug AuthenticationPlug

  def show(conn, _params) do
    render conn, "show"
  end
end
