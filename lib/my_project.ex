defmodule MyProject do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

		# See https://github.com/lancehalvorsen/phoenix-guides/blob/master/database.md for this
		tree = [ worker(Repo, []) ]

    children = [
      # Define workers and child supervisors to be supervised
      # worker(TestApp.Worker, [arg1, arg2, arg3])
    ]

    opts = [strategy: :one_for_one, name: MyProject.Supervisor]
    Supervisor.start_link(tree, opts)
  end
end
