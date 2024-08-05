defmodule JimsegalcomWeb.ShortsController do
  use JimsegalcomWeb, :controller

  alias Jimsegalcom.Shorts
  alias JimsegalcomWeb.NavRoutes

  def index(conn, _params) do
    assigns =
      NavRoutes.put_link([results: Shorts.being_worn?()], :shorts)

    render(conn, :index, assigns)
  end
end
