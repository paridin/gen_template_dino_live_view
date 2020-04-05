defmodule <%= @project_name_camel_case %>Web.Live.WeatherExample do
  @moduledoc """
  WeatherExample for live view demo
  Remove me it is just an example, remember also remove from router.ex`

  https://github.com/chrismccord/phoenix_live_view_example/blob/master/lib/demo_web/live/weather_live.ex
  """
  # instead of use, `use Phoenix.LiveView` this template provides an intragration in <%= @project_name_camel_case %>_web.ex as live_view/0
  # This is why we use: `use <%= @project_name_camel_case %>Web, :live_view` similar to `use <%= @project_name_camel_case %>Web, :controller` or `use <%= @project_name_camel_case %>Web, :view`.
  use <%= @project_name_camel_case %>Web, :live_view

  def render(assigns) do
    ~L"""
    <section class="py-6 mx-10">
      <header class="flex items-center justify-between px-4 py-3 font-bold text-white bg-green-800 rounded shadow-lg">
        <h3 class="text-lg">Weather Example</h3>
        <a target="_blank" class="hover:text-green-500" href="https://github.com/chrismccord/phoenix_live_view_example/blob/master/lib/demo_web/live/weather_live.ex">
          <span class="text-2xl">↬</span> Source
        </a>
      </header>
      <div class="mt-4 text-white bg-green-900 rounded shadow-lg">
        <form phx-submit="set-location">
          <input class="px-2 py-2 text-gray-800" name="location" placeholder="Location" value="<%%= @location %>" />
          <%%= @weather %>
        </form>
      </div>
    </section>
    """
  end

  def mount(_params, _session, socket) do
    send(self(), {:put, "Mexico City"})
    {:ok, assign(socket, location: nil, weather: "...")}
  end

  def handle_event("set-location", %{"location" => location}, socket) do
    {:noreply, put_location(socket, location)}
  end

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