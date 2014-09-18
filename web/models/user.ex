defmodule MyProject.User do
	use Ecto.Model
	import Ecto.Query
	require Logger

	schema "users" do
		field :email,    :string
		field :password, :string
		field :admin,    :boolean
	end

	validate user,
	  email:    present(),
		password: present(),
	  admin:    present()

	def encrypt_password(plaintext) do
		# We must pass char lists to Erlang
		:base64.encode(:crypto.hash(:sha256, to_char_list(plaintext)))
	end

	def find(email, plaintext_password) do
		encrypted_password = encrypt_password(plaintext_password)
		# The pin ^ is mandatory here to inject variables from outside the query
		query = from u in MyProject.User,
		  where: u.email == ^email and u.password == ^encrypted_password,
			select: u
		Repo.all(query)
	end

end
