defmodule MyProject.PageController do
  use Phoenix.Controller
	require AuthenticationPlug

	plug AuthenticationPlug

  def index(conn, _params) do
    render conn, "index"
  end

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end
end
