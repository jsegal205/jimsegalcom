defmodule JimsegalcomWeb.NavRoutes do
  @moduledoc """
  List of routes for navigation
  """
  def routes(assigns) do
    [
      %{
        title: "Home",
        route: "/",
        active: assigns.url == :home
      },
      %{
        title: "Projects",
        route: "https://projects.jimsegal.com",
        external: true
      }
    ]
  end
end
