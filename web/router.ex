defmodule MyProject.Router do
  use Phoenix.Router

  get "/", MyProject.PageController, :index, as: :pages

	# Do not forget MyProject. before the controller name in routes.
	# This is un-Rails and ends up with an error
	#   UndefinedFunctionError) undefined function:
	#   SessionsController.call/2 (module SessionsController is not available)

  get "/login", MyProject.SessionsController, :new, as: :login
  get "/logout", MyProject.SessionsController, :destroy, as: :logout
	resources "/sessions", MyProject.SessionsController, only: [ :create ]
	resources "/users",    MyProject.UsersController
end
