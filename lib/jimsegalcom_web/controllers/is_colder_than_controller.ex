defmodule JimsegalcomWeb.IsColderThanController do
  use JimsegalcomWeb, :controller

  alias Jimsegalcom.IsColderThan
  alias JimsegalcomWeb.NavRoutes

  def show(conn, _params) do
    chicago = %{lat: 41.878114, lon: -87.629798}
    anchorage = %{lat: 61.2175, lon: -149.8584}

    is_it_results = IsColderThan.check(chicago, anchorage)

    assigns =
      NavRoutes.put_link([results: is_it_results], :projects)

    render(conn, :show, assigns)
  end
end
