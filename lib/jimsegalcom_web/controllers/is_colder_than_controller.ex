defmodule JimsegalcomWeb.IsColderThanController do
  use JimsegalcomWeb, :controller

  alias Jimsegalcom.IsColderThan
  alias JimsegalcomWeb.NavRoutes

  def show(conn, _params) do
    is_it_results = IsColderThan.check_chicago_vs_anchorage()

    assigns =
      NavRoutes.put_link([results: is_it_results], :projects)

    render(conn, :show, assigns)
  end
end
