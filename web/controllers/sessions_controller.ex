defmodule MyProject.SessionsController do
  use Phoenix.Controller

  def new(conn, _params) do
    render conn, "new"
  end

  def create(conn, _params) do
    render conn, "create"
  end

  def destroy(conn, _params) do
    render conn, "destroy"
  end
end
