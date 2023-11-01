defmodule JimsegalcomWeb.PageController do
  use JimsegalcomWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    # render(conn, :home, layout: false)
    render(conn, :home, url: :home)
  end

  def other(conn, _) do
    render(conn, :other, url: :other)
  end
end
