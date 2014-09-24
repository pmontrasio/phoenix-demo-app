defmodule Repo do
	use Ecto.Repo, adapter: Ecto.Adapters.Postgres

	def conf do
		user     = System.get_env("DB_USER")
		password = System.get_env("DB_PASSWORD")
		host     = System.get_env("DB_HOST")
		db_name  = System.get_env("DB_NAME")
		parse_url "ecto://#{user}:#{password}@#{host}/#{db_name}"

		# or you can System.get_env("DATABASE_URL") if deploying on Heroku
		# see https://github.com/goshakkk/heroku-buildpack-elixir
	end

	def priv do
		# migration files goes in there
		app_dir :demo_app, "priv/repo"
	end
end
