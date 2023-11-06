defmodule Jimsegalcom.RecipesTest do
  use Jimsegalcom.DataCase

  alias Jimsegalcom.Recipes

  describe "recipes" do
    alias Jimsegalcom.Recipes.Recipe

    import Jimsegalcom.RecipesFixtures

    @invalid_attrs %{description: nil, title: nil, ingredients: nil, slug: nil}

    test "list_recipes/0 returns all recipes" do
      recipe = recipe_fixture()
      assert Recipes.list_recipes() == [recipe]
    end

    test "get_recipe!/1 returns the recipe with given id" do
      recipe = recipe_fixture()
      assert Recipes.get_recipe!(recipe.id) == recipe
    end

    test "create_recipe/1 with valid data creates a recipe" do
      valid_attrs = %{
        description: "some description",
        title: "some title",
        ingredients: "some ingredients",
        slug: "some slug"
      }

      assert {:ok, %Recipe{} = recipe} = Recipes.create_recipe(valid_attrs)
      assert recipe.description == "some description"
      assert recipe.title == "some title"
      assert recipe.ingredients == "some ingredients"
      assert recipe.slug == "some slug"
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_recipe(@invalid_attrs)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()

      update_attrs = %{
        description: "some updated description",
        title: "some updated title",
        ingredients: "some updated ingredients",
        slug: "some updated slug"
      }

      assert {:ok, %Recipe{} = recipe} = Recipes.update_recipe(recipe, update_attrs)
      assert recipe.description == "some updated description"
      assert recipe.title == "some updated title"
      assert recipe.ingredients == "some updated ingredients"
      assert recipe.slug == "some updated slug"
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_recipe(recipe, @invalid_attrs)
      assert recipe == Recipes.get_recipe!(recipe.id)
    end

    test "delete_recipe/1 deletes the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{}} = Recipes.delete_recipe(recipe)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_recipe!(recipe.id) end
    end

    test "change_recipe/1 returns a recipe changeset" do
      recipe = recipe_fixture()
      assert %Ecto.Changeset{} = Recipes.change_recipe(recipe)
    end
  end
end
