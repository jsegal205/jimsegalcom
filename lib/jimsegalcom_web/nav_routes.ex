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
        title: "Other",
        route: "/other",
        active: assigns.url == :other
      }
    ]
  end
end
