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

WARNING: only use the generated certificate for testing in a closed network
environment, such as running a development server on `localhost`.
For production, staging, or testing servers on the public internet, obtain a
proper certificate, for example from [Let's Encrypt](https://letsencrypt.org).

NOTE: when using Google Chrome, open chrome://flags/#allow-insecure-localhost
to enable the use of self-signed certificates on `localhost`.