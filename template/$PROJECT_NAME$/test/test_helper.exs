ExUnit.start()

# {:ok, _} = Application.ensure_all_started(:ex_machina)

case Application.ensure_all_started(:wallaby) do
  {:error, error} ->
    IO.inspect(error)

    raise """
    Remember you need the chromium driver https://chromedriver.chromium.org/downloads

    Download it via curl. be sure you have correct driver for your browser and your OS.

    curl -LO https://chromedriver.storage.googleapis.com/87.0.4280.20/chromedriver_mac64.zip

    unzip chromedriver_mac64.zip && mkdir -p $HOME/.local/bin && mv chromedriver $HOME/.local/bin && echo "Installed remember add \$HOME/.local/bin to your PATH"
    """
  {:ok, _} -> :ok
end

Application.put_env(:wallaby, :base_url, <%= @project_name_camel_case %>Web.Endpoint.url())
