defmodule Jimsegalcom.Projects do
  def list() do
    [
      %{
        title: "Recipes",
        route: "/recipes",
        subtitle: "A bunch of recipes that I frequent and wanted to show off"
      },
      %{
        title: "Legacy Projects",
        route: "https://projects.jimsegal.com"
      }
    ]
  end
end
