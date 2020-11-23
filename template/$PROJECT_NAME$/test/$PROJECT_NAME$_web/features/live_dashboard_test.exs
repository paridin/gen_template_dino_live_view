defmodule <%= @project_name_camel_case %>Web.LiveDashboardTest do
  @moduledoc """
  Visit Liveview Dashboard
  """
  use <%= @project_name_camel_case %>Web.ConnCase, async: true
  import <%= @project_name_camel_case %>Web.ConnCase.Helpers
  import Phoenix.LiveViewTest

  setup %{conn: conn} do
    conn = log_in_basic(conn)
    %{conn: conn}
  end

  test "Visit Live Dashboard", %{conn: conn} do
    assert {:error, {:live_redirect, %{flash: _flash, to: to}}} = live(conn, Routes.live_dashboard_path(conn, :home))
    assert to =~ "/dashboard/"
  end
end
