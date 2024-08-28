defmodule JimsegalcomWeb.NavRoutes do
  @moduledoc """
  List of routes for navigation
  """

  def routes(_) do
    [
      %{
        title: "Home",
        route: "/",
        link: :home
      },
      %{
        title: "Projects",
        route: "/projects",
        link: :projects
      }
    ]
  end

  def put_link(link) do
    put_link([], link)
  end

  def put_link(assigns, link) do
    Keyword.put_new(assigns, :link, link)
  end
end
