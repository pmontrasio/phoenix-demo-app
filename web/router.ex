defmodule DemoApp.Router do
  use Phoenix.Router

  get "/", DemoApp.PageController, :index, as: :pages

	#resources "/sessions", SessionsController

	get  "/sessions/new",     DemoApp.SessionsController, :new,     as: :sessions
	get  "/sessions/destroy", DemoApp.SessionsController, :destroy, as: :sessions
	post "/sessions",         DemoApp.SessionsController, :create,  as: :sessions

	resources "/users",       DemoApp.UsersController, only: [ :show ]

	scope path: "/admin", alias: DemoApp.Admin, helper: "admin" do
		resources "/users",  UsersController, only: [ :show ]
	end
end
