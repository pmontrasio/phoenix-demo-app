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

3. Run the migrations with `mix ecto.migrate Repo`

4. Seed the database with `mix run seed.exs`

5. Start Phoenix router with `DB_USER=demo_app DB_PASSWORD=password DB_HOST=localhost DB_NAME=demo_app mix phoenix.start`

Now you can visit `localhost:4000` from your browser.

6. Login as an admin with admin@example.com / password or login as a user with user@example.com / password.
