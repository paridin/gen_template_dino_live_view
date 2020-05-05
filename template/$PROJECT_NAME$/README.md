# <%= @project_name_camel_case %>

To start your Phoenix server:

  * cd <%= @project_name %> && mix deps.get && npm i --prefix assets && mix phx.gen.cert -o priv/ssl/<%= @project_name %>
  * Start Phoenix endpoint with `mix phx.server` or `iex -S mix phx.server`.

Now you can visit [`localhost:4001`](https://localhost:4001) from your browser.

```
  Created: <%= @now.local.date_time %>
  based on
    elixir: <%= @elixir_version %>
    erlang: <%= @erlang_version %>
    OTP: <%= @otp_release %>
```

Remember to update the `mix.exs` file with your own configuration.

Accessing into [`dashboard`](https://localhost:4001/dashboard) requires credentials, check the `lib/<%= @project_name %>_web/router.ex` file.

WARNING: only use the generated certificate for testing in a closed network
environment, such as running a development server on `localhost`.
For production, staging, or testing servers on the public internet, obtain a
proper certificate, for example from [Let's Encrypt](https://letsencrypt.org).

NOTE: when using Google Chrome, open chrome://flags/#allow-insecure-localhost
to enable the use of self-signed certificates on `localhost`.

### build a docker image (production mode).

```bash
docker build --build-arg SECRET_KEY_BASE=$(mix phx.gen.secret) --tag <%= @project_name %>:$(grep 'version:' mix.exs | cut -d '"' -f2) .
```

### run the docker image.

```bash
docker run --publish 443:443 <%= @project_name %>:$(grep 'version:' mix.exs | cut -d '"' -f2)
```

### self-signed certs with [mkcert](https://github.com/FiloSottile/mkcert)

By default self-signed certs are invalid, but [mkcert](https://github.com/FiloSottile/mkcert) is the tool to make them valid, after you install it run.

```bash
mkcert -install
mkcert -key-file ./priv/ssl/<%= @project_name %>_key.pem -cert-file ./priv/ssl/<%= @project_name %>.pem <%= @project_name %> "*.<%= @project_name %>" localhost 127.0.0.1 ::1
```