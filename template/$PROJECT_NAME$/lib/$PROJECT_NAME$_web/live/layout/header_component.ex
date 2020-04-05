defmodule <%= @project_name_camel_case %>Web.Live.Layout.Header do
  @moduledoc """
  Header
  """
  use <%= @project_name_camel_case %>Web, :live_component

  def render(assigns) do
    ~L"""
    <header id="header-<%%= @id %>" class="relative bg-gray-100">
      <div class="relative z-10">
        <div class="px-8 py-4">
          <nav class="relative flex items-center justify-between sm:h-10">
            <div class="flex items-center flex-grow flex-shrink-0 lg:flex-grow-0">
              <div class="flex items-center justify-between w-full md:w-auto">
                <a href="#">
                  <img class="w-auto h-8 sm:h-10" src="/images/logos/dino.svg" alt="dino" />
                </a>
                <div class="flex items-center -mr-2 md:hidden">
                  <button phx-click="open" phx-target="#header-<%%= @id %>" type="button" class="inline-flex items-center justify-center p-2 text-gray-400 transition duration-150 ease-in-out rounded-md hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500">
                    <svg class="w-6 h-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                    </svg>
                  </button>
                </div>
              </div>
            </div>
            <div class="hidden md:block md:ml-10 md:pr-4">
              <%%= live_redirect "Home", to: Routes.live_path(@socket, <%= @project_name_camel_case %>Web.Live.Home), class: "font-medium text-gray-500 transition duration-150 ease-in-out hover:text-gray-900 focus:outline-none focus:text-gray-900" %>
              <%%= live_redirect "Weather Example", to: Routes.live_path(@socket, <%= @project_name_camel_case %>Web.Live.WeatherExample), class: "ml-8 font-medium text-indigo-600 transition duration-150 ease-in-out hover:text-indigo-900 focus:outline-none focus:text-indigo-700" %>
            </div>
          </nav>
        </div>
        <div x-show="open" class="<%%= if @open_menu_mobile? do 'block' else 'hidden' end %> absolute duration-150 ease-out inset-x-0 top-0 p-2 transition origin-top-right transform md:hidden">
          <div class="rounded-lg shadow-md">
            <div class="bg-gray-200 rounded-lg shadow-xs">
              <div class="flex items-center justify-between px-5 pt-4">
                <div>
                  <img class="w-auto h-8" src="/images/logos/dino.svg" alt="dino" />
                </div>
                <div class="-mr-2">
                  <button phx-click="close" phx-target="#header-<%%= @id %>" type="button" class="inline-flex items-center justify-center p-2 text-gray-400 transition duration-150 ease-in-out rounded-md hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500">
                    <svg class="w-6 h-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                  </button>
                </div>
              </div>
              <div class="flex flex-col px-2 pt-2 pb-3">
                <%%= live_redirect "Home", to: Routes.live_path(@socket, <%= @project_name_camel_case %>Web.Live.Home), class: "mt-2 font-medium text-gray-500 transition duration-150 ease-in-out hover:text-gray-900 focus:outline-none focus:text-gray-900" %>
                <%%= live_redirect "Weather Example", to: Routes.live_path(@socket, <%= @project_name_camel_case %>Web.Live.WeatherExample), class: "mt-2 pb-1 font-medium text-indigo-600 transition duration-150 ease-in-out hover:text-indigo-900 focus:outline-none focus:text-indigo-700" %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    """
  end

  def handle_event("close", _params, socket) do
    {:noreply, assign(socket, open_menu_mobile?: false)}
  end

  def handle_event("open", _params, socket) do
    {:noreply, assign(socket, open_menu_mobile?: true)}
  end
end
