defmodule Jimsegalcom.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Jimsegalcom.Games` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        name: "some name",
        url: "some url",
        image_url: "some image_url",
        bgg_id: 42
      })
      |> Jimsegalcom.Games.create_game()

    game
  end
end
