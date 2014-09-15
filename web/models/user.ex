defmodule MyProject.User do
	use Ecto.Model

	validate user,
	  email: present(),
		password: present()

	schema "users" do
		field :email, :string
		field :password, :string
	end

	def encrypt_password(plaintext) do
		# We must pass char lists to Erlang
		:base64.encode(:crypto.hash(:sha256, to_char_list(plaintext)))
	end

end
