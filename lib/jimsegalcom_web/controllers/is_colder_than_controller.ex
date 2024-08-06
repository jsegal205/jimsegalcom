defmodule JimsegalcomWeb.IsColderThanController do
  use JimsegalcomWeb, :controller

  alias JimsegalcomWeb.NavRoutes

  def show(conn, _params) do
    assigns =
      NavRoutes.put_link([results: "maybe"], :projects)

    render(conn, :show, assigns)
  end
end
