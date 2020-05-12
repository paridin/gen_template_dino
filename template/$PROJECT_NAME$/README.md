# <%= @project_name_camel_case %>

### Development

If you don't have a `PostgreSQL` installation on your machine, or your prefers Docker instead.

```bash
docker run -e POSTGRES_PASSWORD=postgres -d --name <%= @project_name %> -v "$PWD/.database/<%= @project_name %>":/var/lib/postgresql/data -p 5432:5432 postgres:12
```

Also remember if you have the port `5432` busy instead of `-p 5432:5432` use `-p my_port:5432` where my_port must be in the range of private ports, so 54320 could be enough.
be sure you also update the config at `config/dev.exs` and `config/test.exs` files.

```
config :<%= @project_name %>, <%= @project_name_camel_case %>.Repo,
  ...
  port: 54320
```

```bash
docker run -e POSTGRES_PASSWORD=postgres -d --name <%= @project_name %> -v "$PWD/.database/<%= @project_name %>":/var/lib/postgresql/data -p 54320:5432 postgres:12
```

Then you must create the database to do that use `mix ecto.create` and then run `iex -S mix` to run the app and have an interactive shell.

To start your Phoenix server:

  * cd <%= @project_name %> && mix deps.get && npm i --prefix assets && mix phx.gen.cert -o priv/ssl/<%= @project_name %>
  * Start Phoenix endpoint with `mix phx.server` or `iex -S mix phx.server`.

Now you can visit [`localhost:4000`](https://localhost:4000) from your browser.

Remember to update the `mix.exs` file with your own configuration.

Accessing into [`dashboard`](https://localhost:4000/dashboard) requires credentials, check the `lib/<%= @project_name %>_web/router.ex` file.

WARNING: only use the generated certificate for testing in a closed network
environment, such as running a development server on `localhost`.
For production, staging, or testing servers on the public internet, obtain a
proper certificate, for example from [Let's Encrypt](https://letsencrypt.org).

NOTE: when using Google Chrome, open chrome://flags/#allow-insecure-localhost
to enable the use of self-signed certificates on `localhost`.


### self-signed certs with [mkcert](https://github.com/FiloSottile/mkcert)

By default self-signed certs are invalid, but [mkcert](https://github.com/FiloSottile/mkcert) is the tool to make them valid, after you install it run.

```bash
mkcert -install
mkcert -key-file ./priv/ssl/<%= @project_name %>_key.pem -cert-file ./priv/ssl/<%= @project_name %>.pem <%= @project_name %> "*.<%= @project_name %>" localhost 127.0.0.1 ::1
```

### Production


### build a docker image (production mode).

```bash
docker build --build-arg DATABASE_URL=ecto://<%= @db_user %>:<%= @db_psw %>@<%= @db_host %>/<%= @project_name %> --build-arg SECRET_KEY_BASE=$(mix phx.gen.secret) --tag <%= @project_name %>:$(grep 'version:' mix.exs | cut -d '"' -f2) .
```

### run the docker image.

```bash
docker run --publish 443:443 <%= @project_name %>:$(grep 'version:' mix.exs | cut -d '"' -f2)
```