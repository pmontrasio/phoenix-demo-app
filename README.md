# MyProject

Demo project for the Ruby Day 2014
http://www.rubyday.it/

More about this project at http://connettiva.eu/rubyday

To start this Phoenix application you have to:

1. Create a database

PostgreSQL:


```
$ psql -U postgres
create role my_project login password 'password';
create database my_project owner my_project encoding='UTF8' lc_collate='en_US.utf8' lc_ctype='en_US.utf8';
create database my_project owner my_project encoding='UTF8' lc_collate='en_US.UTF-8' lc_ctype='en_US.UTF-8';
grant all on database my_project to my_project;
alter database my_project owner to my_project;
\q
```

Exercise: adapt this to MySQL.
Hint: you need to change the driver in mix.exs and lib/my_project/repo.ex
Google for the driver.

2. Install dependencies with `mix do deps.get, compile`

3. Run the migrations with `mix ecto.migrate Repo`

4. Seed the database

```
mix run seed.exs
```

5. Start Phoenix router with `mix phoenix.start`

Now you can visit `localhost:4000` from your browser.

6. Login as an admin with admin@example.com / password or login as a user with user@example.com / password.

# LICENSE

This code, by Paolo Montrasio, is licensed under a Creative Commons Attribution ShareAlike 3.0

http://creativecommons.org/licenses/by-sa/3.0/