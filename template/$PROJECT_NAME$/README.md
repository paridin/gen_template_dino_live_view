# <%= @project_name_camel_case %>

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && yarn`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

```
  Created: <%= @now.local.date_time %>
  based on
    elixir: <%= @elixir_version %>
    erlang: <%= @erlang_version %>
    OTP: <%= @otp_release %>
```

Remember to update de mix.exs file with your project urls.