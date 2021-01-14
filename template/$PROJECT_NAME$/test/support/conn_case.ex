defmodule <%= @project_name_camel_case %>Web.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """
  import Plug.BasicAuth
  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import Phoenix.LiveViewTest
      import <%= @project_name_camel_case %>Web.ConnCase.Helpers

      alias <%= @project_name_camel_case %>Web.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint <%= @project_name_camel_case %>Web.Endpoint
    end
  end

  setup _tags do
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end

  defmodule Helpers do
    @moduledoc false
    def log_in_basic(conn) do
      username = "<%= @basic_auth_user %>"
      password = "<%= @basic_auth_password %>"

      conn
      |> Phoenix.ConnTest.init_test_session(%{})
      |> Plug.Conn.put_req_header("authorization", encode_basic_auth(username, password))
      |> basic_auth(username: username, password: password)
    end
  end
end
