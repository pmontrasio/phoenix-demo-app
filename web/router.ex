defmodule MyProject.Router do
  use Phoenix.Router

  get "/", MyProject.PageController, :index, as: :pages

	#resources "/sessions", SessionsController

	get  "/sessions/new",     MyProject.SessionsController, :new,     as: :sessions
	get  "/sessions/destroy", MyProject.SessionsController, :destroy, as: :sessions
	post "/sessions",         MyProject.SessionsController, :create,  as: :sessions

	resources "/users",       MyProject.UsersController, only: [ :show ]

	scope path: "/admin", alias: MyProject.Admin, helper: "admin" do
		resources "/users",  UsersController, only: [ :show ]
	end
end
