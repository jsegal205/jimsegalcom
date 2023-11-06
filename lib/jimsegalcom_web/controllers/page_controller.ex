defmodule JimsegalcomWeb.PageController do
  alias JimsegalcomWeb.NavRoutes
  use JimsegalcomWeb, :controller

  def home(conn, _params) do
    render(conn, :home, NavRoutes.put_link(:home))
  end
end
