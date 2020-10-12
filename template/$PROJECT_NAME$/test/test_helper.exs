ExUnit.start()

# {:ok, _} = Application.ensure_all_started(:ex_machina)
{:ok, _} = Application.ensure_all_started(:wallaby)

Application.put_env(:wallaby, :base_url, <%= @project_name_camel_case %>Web.Endpoint.url())
