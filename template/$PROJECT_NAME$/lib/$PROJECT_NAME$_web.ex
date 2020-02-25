defmodule <%= @project_name_camel_case %>Web do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use <%= @project_name_camel_case %>Web, :controller
      use <%= @project_name_camel_case %>Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: <%= @project_name_camel_case %>Web

      import Plug.Conn
      import <%= @project_name_camel_case %>Web.Gettext
      import Phoenix.LiveView.Controller, only: [live_render: 3]
      alias <%= @project_name_camel_case %>Web.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/<%= @project_name %>_web/templates",
        namespace: <%= @project_name_camel_case %>Web

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import <%= @project_name_camel_case %>Web.ErrorHelpers
      import <%= @project_name_camel_case %>Web.Gettext
      import Phoenix.LiveView.Helpers
      alias <%= @project_name_camel_case %>Web.Router.Helpers, as: Routes
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView, layout: {<%= @project_name_camel_case %>Web.LayoutView, "live.html"}
      import Phoenix.LiveView.Helpers

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]
      import Phoenix.HTML.Link, only: [link: 2]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import <%= @project_name_camel_case %>Web.ErrorHelpers
      import <%= @project_name_camel_case %>Web.Gettext
      alias <%= @project_name_camel_case %>Web.Router.Helpers, as: Routes
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent
      import Phoenix.LiveView.Helpers

      # Import convenience functions from controllers
      # import Phoenix.Controller, only: [get_flash: 2, view_module: 1]
      import Phoenix.HTML.Link, only: [link: 2]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import <%= @project_name_camel_case %>Web.ErrorHelpers
      import <%= @project_name_camel_case %>Web.Gettext
      alias <%= @project_name_camel_case %>Web.Router.Helpers, as: Routes
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import <%= @project_name_camel_case %>Web.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
