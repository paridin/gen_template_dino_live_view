defmodule <%= @project_name_camel_case %>Web.Live.WeatherExample do
  @moduledoc """
  WeatherExample for live view demo
  Remove me it is just an example, remember also remove from router.ex`

  https://github.com/chrismccord/phoenix_live_view_example/blob/master/lib/demo_web/live/weather_live.ex
  """
  # instead of use, `use Phoenix.LiveView` this template provides an intragration in <%= @project_name_camel_case %>_web.ex as live_view/0
  # This is why we use: `use <%= @project_name_camel_case %>Web, :live_view` similar to `use <%= @project_name_camel_case %>Web, :controller` or `use <%= @project_name_camel_case %>Web, :view`.
  use <%= @project_name_camel_case %>Web, :live_view

  @impl true
  def render(assigns) do
    ~L"""
    <section class="py-6 mx-10">
      <header class="flex items-center justify-between px-4 py-3 font-bold text-white bg-green-800 rounded shadow-lg">
        <h3 class="text-lg">Weather Example</h3>
        <a target="_blank" class="hover:text-green-500" href="https://github.com/chrismccord/phoenix_live_view_example/blob/master/lib/demo_web/live/weather_live.ex">
          <span class="text-2xl">↬</span> Source
        </a>
      </header>
      <nav class="flex flex-col my-4">
        <header class="text-lg">
          Try live flash messages
        </header>
        <div class="p-4 bg-green-800">
          <%%= for {kind, _msg, class} <- @live_flashes do %>
            <button phx-click="set-flash" phx-value-kind="<%%= kind %>" class="<%%= class %> focus:outline-none rounded-md text-gray-800 px-2.5 py-1.5"><%%= kind %></button>
          <%% end %>
        </div>
      </nav>
      <div class="mt-4 text-white bg-green-900 rounded shadow-lg">
        <form phx-submit="set-location">
          <input class="px-2 py-2 text-gray-800" name="location" placeholder="Location" value="<%%= @location %>" />
          <%%= @weather %>
        </form>
      </div>
    </section>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    send(self(), {:put, "Mexico City"})
    live_flashes = [
      {:success, "Excellent your are watching a success message", "bg-green-50"},
      {:info, "An info message is displayed", "bg-blue-50"},
      {:warn, "Oops we warn you with this message", "bg-yellow-50"},
      {:error, "An error message is detected", "bg-red-50"}
    ]

    {:ok, assign(socket, location: nil, weather: "...", live_flashes: live_flashes)}
  end

  @impl true
  def handle_event("set-location", %{"location" => location}, socket) do
    {:noreply, put_location(socket, location)}
  end

  @impl true
  def handle_event("set-flash", %{"kind" => kind}, socket) do
    {kind, msg, _class} =
      socket.assigns.live_flashes
      |> Enum.filter(fn {k, _msg, _class} -> k == String.to_existing_atom(kind) end)
      |> hd()

    {:noreply, put_flash(socket, kind, msg)}
  end


  @impl true
  def handle_info({:put, location}, socket) do
    {:noreply, put_location(socket, location)}
  end

  defp put_location(socket, location) do
    assign(socket, location: location, weather: weather(location))
  end

  defp weather(local) do
    {:ok, {{_, 200, _}, _, body}} =
      :httpc.request(:get, {~c"http://wttr.in/#{URI.encode(local)}?format=1", []}, [], [])

    IO.iodata_to_binary(body)
  end
end
