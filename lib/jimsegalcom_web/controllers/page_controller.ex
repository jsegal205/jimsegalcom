defmodule JimsegalcomWeb.PageController do
  alias JimsegalcomWeb.NavRoutes
  use JimsegalcomWeb, :controller

  def home(conn, _params) do
    render(conn, :home, NavRoutes.put_link(:home))
  end

  def not_found(conn, _) do
    render(conn, :not_found, NavRoutes.put_link(:not_found))
  end
end
