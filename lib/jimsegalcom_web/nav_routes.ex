defmodule JimsegalcomWeb.NavRoutes do
  @moduledoc """
  List of routes for navigation
  """
  def routes(assigns) do
    url = Map.get(assigns, :url, :add_url_to_render)

    [
      %{
        title: "Home",
        route: "/",
        active: url == :home
      },
      %{
        title: "Projects",
        route: "https://projects.jimsegal.com",
        external: true
      }
    ]
  end
end
