defmodule Jimsegalcom.Projects do
  @moduledoc """
  Projects context
  """

  def list() do
    [
      %{
        title: "Recipes",
        route: "/recipes",
        subtitle: "A bunch of recipes that I frequent and wanted to show off"
      },
      %{
        title: "Is Jim Wearing Shorts",
        route: "/isjimwearingshorts",
        subtitle: "A question that is burning in the back of everyone's mind"
      },
      %{
        title: "Is Chicago Colder Than Anchorage",
        route: "/ischicagocolderthananchorage",
        subtitle: "Another question that is burning in the back of everyone's mind"
      },
      %{
        title: "Legacy Projects",
        route: "https://projects.jimsegal.com"
      }
    ]
  end
end
