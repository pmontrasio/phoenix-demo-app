admin = %MyProject.User{ email: "admin@example.com", password: MyProject.User.encrypt_password("password") }
user  = %MyProject.User{ email: "user@example.com",  password: MyProject.User.encrypt_password("password") }

# Start the repo process
Repo.start_link

Repo.insert(admin)
Repo.insert(user)