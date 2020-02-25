defmodule <%= @project_name_camel_case %>Web.Live.Layout.Header do
  @moduledoc """
  Header
  """
  use <%= @project_name_camel_case %>Web, :live_component

  def render(assigns) do
    ~L"""
    <header class="flex justify-between px-4 py-2 mb-2 font-medium bg-white">
      <h1><%%= @title %></h1>
      <nav>
        <%%= live_redirect("Home", to: Routes.live_path(@socket, <%= @project_name_camel_case %>Web.Live.Home)) %> |
        <%%= live_redirect("Top Example", to: Routes.live_path(@socket, <%= @project_name_camel_case %>Web.Live.TopExample)) %>
      </nav>
    </header>
    """
  end
end
