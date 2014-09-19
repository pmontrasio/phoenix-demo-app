defmodule Repo do
	use Ecto.Repo, adapter: Ecto.Adapters.Postgres

	def conf do
		#                 user       pass     host      db name
		parse_url "ecto://demo_app:password@localhost/demo_app"
	end

	def priv do
		# migration files goes in there
		app_dir :demo_app, "priv/repo"
	end
end
