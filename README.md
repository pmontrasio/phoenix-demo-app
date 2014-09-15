# MyProject

Demo project for the Ruby Day 2014
http://www.rubyday.it/

More about this project at http://connettiva.eu/rubyday

To start this Phoenix application you have to:

1. Create a database

In postgresql (adapt to mysql):

```
$ psql -U postgres
create role my_project login password 'password';
create database my_project owner my_project encoding='UTF8' lc_collate='en_US.utf8' lc_ctype='en_US.utf8';
create database my_project owner my_project encoding='UTF8' lc_collate='en_US.UTF-8' lc_ctype='en_US.UTF-8';
grant all on database my_project to my_project;
alter database my_project owner to my_project;
\q
```

If you're using mysql you need to change the driver in mix.exs and lib/my_project/repo.ex

2. Install dependencies with `mix do deps.get, compile`

3. Run the migrations with `mix ecto.migrate Repo`

4. Start Phoenix router with `mix phoenix.start`

Now you can visit `localhost:4000` from your browser.
