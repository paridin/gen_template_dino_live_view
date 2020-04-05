defmodule <%= @project_name_camel_case %>Web.Live.Home do
  @moduledoc """
  Home View
  """
  use <%= @project_name_camel_case %>Web, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <section class="flex flex-wrap items-center justify-center py-6">
      <div class="flex mr-2 lg:flex-1">
        <img class="object-fill w-full h-56 sm:h-72 md:h-96 lg:w-11/12 lg:h-11/12" src="/images/logos/dino.svg" alt="dino" />
      </div>
      <div class="flex ml-2 sm:flex-1">
        <div class="px-4 sm:pl-6">
          <h2 class="text-4xl font-extrabold leading-10 tracking-tight text-gray-900 sm:text-5xl sm:leading-none md:text-6xl">
            Dino Boilerplate
            <span class="block py-1 text-indigo-600"><%= @project_name_camel_case %></span>
          </h2>
          <p class="mt-3 text-base text-gray-500 sm:mt-5 sm:text-lg sm:max-w-xl sm:mx-auto md:mt-5 md:text-xl lg:mx-0">
            An opinionated boilerplate to create phoenix apps, using live view and tailwind.
          </p>
        </div>
      </div>
    </section>
    """
  end
end
