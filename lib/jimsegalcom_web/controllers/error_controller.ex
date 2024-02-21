defmodule JimsegalcomWeb.ErrorController do
  use JimsegalcomWeb, :controller

  alias JimsegalcomWeb.NavRoutes

  def not_found(conn, _) do
    conn
    |> put_status(:not_found)
    |> render("404.html", NavRoutes.put_link(:not_found))
  end
end
