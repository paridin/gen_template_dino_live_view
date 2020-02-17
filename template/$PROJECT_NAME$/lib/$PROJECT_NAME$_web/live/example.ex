defmodule <%= @project_name_camel_case %>Web.Live.Example do
  @moduledoc """
  Example for live view demo
  Remove me it is just an example

  https://github.com/chrismccord/phoenix_live_view_example/blob/4a38c77a1f8b4ccc3b4b75aa581b28d51d70530c/lib/demo_web/live/top_live.ex
  """
  # instead of use, `use Phoenix.LiveView` this template provides an intragration in <%= @project_name %>_web.ex as live_view/0
  # This is why we use: `use <%= @project_name_camel_case %>Web, :live_view` similar to `use <%= @project_name_camel_case %>Web, :controller` or `use <%= @project_name_camel_case %>Web, :view`.
  use <%= @project_name_camel_case %>Web, :live_view

  def render(assigns) do
    ~L"""
    <section class="mx-10">
      <header class="flex items-center justify-between px-4 py-3 font-bold text-white bg-green-800 rounded shadow-lg">
        <h3 class="text-lg">Live View Example</h3>
        <a class="hover:text-green-500" href="https://github.com/chrismccord/phoenix_live_view_example/blob/4a38c77a1f8b4ccc3b4b75aa581b28d51d70530c/lib/demo_web/live/top_live.ex">
          <span class="text-2xl">↬</span> Source
        </a>
      </header>
      <div class="mt-4 text-white bg-green-900 rounded shadow-lg">
        <pre class="px-4 overflow-auto scrolling-touch font-mono text-sm h-custom-40">
          <%%= @top %>
        </pre>
      </div>
    </section>
    """
  end

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tick)

    {:ok, put_top(socket)}
  end

  def handle_info(:tick, socket) do
    {:noreply, put_top(socket)}
  end

  defp put_top(socket) do
    case :os.type() do
      {:unix, :darwin} ->
        {top, 0} = System.cmd("top", ["-l", "1"])
        assign(socket, top: top)
      {:unix, :linux} ->
        {top, 0} = System.cmd("top", ["-n", "1", "-b"])
        assign(socket, top: top)
    end
  end
end
