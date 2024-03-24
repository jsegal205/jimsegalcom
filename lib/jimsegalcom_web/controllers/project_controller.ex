defmodule JimsegalcomWeb.ProjectController do
  use JimsegalcomWeb, :controller

  alias Jimsegalcom.Projects
  alias JimsegalcomWeb.NavRoutes

  def index(conn, _params) do
    projects = Projects.list()
    assigns = NavRoutes.put_link([projects: projects], :projects)

    render(conn, :index, assigns)
  end
end
