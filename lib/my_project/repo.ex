defmodule Repo do
	use Ecto.Repo, adapter: Ecto.Adapters.Postgres

	def conf do
		#                 user       pass     host      db name
		parse_url "ecto://my_project:password@localhost/my_project"
	end

	def priv do
		# migration files goes in there
		app_dir :my_project, "priv/repo"
	end
end