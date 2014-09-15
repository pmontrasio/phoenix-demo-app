defmodule Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    "CREATE TABLE users(id serial primary key, email varchar, password varchar)"
  end

  def down do
    "DROP TABLE users"
  end
end
