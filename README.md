# DemoApp

To start this Phoenix application you have to:

1. Create a database

PostgreSQL:

    $ psql -U postgres
    create role demo_app login password 'password';
    create database demo_app owner demo_app encoding='UTF8' lc_collate='en_US.UTF-8' lc_ctype='en_US.UTF-8';
    grant all on database demo_app to demo_app;
    alter database demo_app owner to demo_app;
    \q

Exercise: adapt this to MySQL.
Hint: you need to change the driver in `mix.exs` and `lib/demo_app/repo.ex`
Google for the driver.

2. Install dependencies with `mix do deps.get, compile`

3. Set the environment variables to access the database (check `lib/demo_app/repo.ex`)

    export DB_USER=demo_app
    export DB_PASSWORD=password
    export DB_HOST=localhost
    export DB_NAME=demo_app

4. Run the migrations with `mix ecto.migrate Repo`

5. Seed the database with `mix run seed.exs`

6. Start Phoenix router with `mix phoenix.start`

7. Visit `localhost:4000`

8. Login as an admin with admin@example.com / password or login as a user with user@example.com / password.

9. Follow the instructions inside the pages.

10. Fork it and make it better!

# Deploy on Heroku

I'm working on it. See https://github.com/goshakkk/heroku-buildpack-elixir/issues/13
