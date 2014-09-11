defmodule MyProject.Router do
  use Phoenix.Router

  get "/", MyProject.PageController, :index, as: :pages

end
