defmodule Jimsegalcom.RecipesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Jimsegalcom.Recipes` context.
  """

  @doc """
  Generate a recipe.
  """
  def recipe_fixture(attrs \\ %{}) do
    {:ok, recipe} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title",
        ingredients: "some ingredients",
        notes: "some notes",
        reference_link: "some reference link",
        slug: "some slug"
      })
      |> Jimsegalcom.Recipes.create_recipe()

    recipe
  end
end
