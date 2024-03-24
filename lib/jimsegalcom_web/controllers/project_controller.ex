defmodule JimsegalcomWeb.ProjectController do
  use JimsegalcomWeb, :controller

  alias JimsegalcomWeb.NavRoutes

  def index(conn, _) do
    render(conn, :index, NavRoutes.put_link(:projects))
  end
end
