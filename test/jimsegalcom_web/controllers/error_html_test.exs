defmodule JimsegalcomWeb.ErrorHTMLTest do
  use JimsegalcomWeb.ConnCase, async: true

  # Bring render_to_string/4 for testing custom views
  import Phoenix.Template

  test "renders 404.html" do
    assert render_to_string(JimsegalcomWeb.ErrorHTML, "404", "html", []) ==
             "<div>oops not found</div>"
  end

  test "renders 500.html" do
    assert render_to_string(JimsegalcomWeb.ErrorHTML, "500", "html", []) ==
             "<div>oops server error</div>"
  end
end
