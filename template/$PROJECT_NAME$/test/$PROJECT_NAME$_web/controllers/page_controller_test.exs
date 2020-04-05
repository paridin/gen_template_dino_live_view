defmodule <%= @project_name_camel_case %>Web.LayoutControllerTest do
  use <%= @project_name_camel_case %>Web.ConnCase, async: true

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "font-sans antialiased"
  end
end
