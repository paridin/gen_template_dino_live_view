defmodule <%= @project_name_camel_case %>Web.LayoutView do
  @moduledoc """
  LayoutView allows us to embed JS and CSS to deploy as a single unit without worries.
  """
  use <%= @project_name_camel_case %>Web, :view

  js_path = Path.join(__DIR__, "../../../priv/static/js/app.js")
  css_path = Path.join(__DIR__, "../../../priv/static/css/app.css")

  @external_resource js_path
  @external_resource css_path

  @app_js File.read!(js_path)
  @app_css File.read!(css_path)

  def render("app.js", _), do: @app_js
  def render("app.css", _), do: @app_css

  def live_socket_path(conn) do
    [Enum.map(conn.script_name, &["/" | &1]) | "/live"]
  end
end
