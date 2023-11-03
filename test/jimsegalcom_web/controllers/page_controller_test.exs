defmodule JimsegalcomWeb.PageControllerTest do
  use JimsegalcomWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Jim Segal"
    assert html_response(conn, 200) =~ "Software Engineer, Amateur Photographer"
  end
end
