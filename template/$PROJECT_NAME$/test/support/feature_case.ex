defmodule <%= @project_name_camel_case %>Web.FeatureCase do
  @moduledoc """
  Feature Case
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      # import <%= @project_name_camel_case %>.Factory
      alias <%= @project_name_camel_case %>Web.Router.Helpers, as: Routes

      @endpoint <%= @project_name_camel_case %>Web.Endpoint
    end
  end

  setup tags do
    # :ok = Ecto.Adapters.SQL.Sandbox.checkout(<%= @project_name_camel_case %>.Repo)

    # unless tags[:async] do
    #   Ecto.Adapters.SQL.Sandbox.mode(<%= @project_name_camel_case %>.Repo, {:shared, self()})
    # end

    # metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(<%= @project_name_camel_case %>.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
