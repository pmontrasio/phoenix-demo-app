admin = %DemoApp.User{ email: "admin@example.com", password: DemoApp.User.encrypt_password("password"), admin: true }
user  = %DemoApp.User{ email: "user@example.com",  password: DemoApp.User.encrypt_password("password"), admin: false }

# Start the repo process
Repo.start_link

Repo.insert(admin)
Repo.insert(user)