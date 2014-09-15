defmodule MyProject.User do
	use Ecto.Model

	validate user,
	  email: present(),
		password: present()

	schema "users" do
		field :email, :string
		field :password, :string
	end
end
