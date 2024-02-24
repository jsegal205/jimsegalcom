defmodule JimsegalcomWeb.RecipeControllerTest do
  use JimsegalcomWeb.ConnCase

  import Jimsegalcom.RecipesFixtures

  @create_attrs %{
    description: "some description",
    title: "some title",
    ingredients: "some ingredients",
    slug: "some slug"
  }
  @update_attrs %{
    description: "some updated description",
    title: "some updated title",
    ingredients: "some updated ingredients",
    slug: "some updated slug"
  }
  @invalid_attrs %{description: nil, title: nil, ingredients: nil, slug: nil}

  describe "index" do
    test "lists all recipes", %{conn: conn} do
      conn = get(conn, ~p"/recipes")
      assert html_response(conn, 200) =~ "Recipes"
    end
  end

  describe "show" do
    setup [:create_recipe]

    test "lists individual recipe", %{conn: conn, recipe: recipe} do
      conn = get(conn, ~p"/recipes/#{recipe.slug}")
      response = html_response(conn, 200)
      assert response =~ recipe.title
      assert response =~ recipe.ingredients
      assert response =~ recipe.directions
      assert response =~ recipe.notes
      assert response =~ recipe.reference_link
    end
  end

  describe "new recipe" do
    @tag :skip
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/recipes/new")
      assert html_response(conn, 200) =~ "New Recipe"
    end
  end

  describe "create recipe" do
    @tag :skip
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/recipes", recipe: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/recipes/#{id}"

      conn = get(conn, ~p"/recipes/#{id}")
      assert html_response(conn, 200) =~ "Recipe #{id}"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/recipes", recipe: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Recipe"
    end
  end

  describe "edit recipe" do
    setup [:create_recipe]
    @tag :skip
    test "renders form for editing chosen recipe", %{conn: conn, recipe: recipe} do
      conn = get(conn, ~p"/recipes/#{recipe}/edit")
      assert html_response(conn, 200) =~ "Edit Recipe"
    end
  end

  describe "update recipe" do
    setup [:create_recipe]

    @tag :skip
    test "redirects when data is valid", %{conn: conn, recipe: recipe} do
      conn = put(conn, ~p"/recipes/#{recipe}", recipe: @update_attrs)
      assert redirected_to(conn) == ~p"/recipes/#{recipe}"

      conn = get(conn, ~p"/recipes/#{recipe}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn, recipe: recipe} do
      conn = put(conn, ~p"/recipes/#{recipe}", recipe: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Recipe"
    end
  end

  describe "delete recipe" do
    setup [:create_recipe]

    @tag :skip
    test "deletes chosen recipe", %{conn: conn, recipe: recipe} do
      conn = delete(conn, ~p"/recipes/#{recipe}")
      assert redirected_to(conn) == ~p"/recipes"

      assert_error_sent 404, fn ->
        get(conn, ~p"/recipes/#{recipe}")
      end
    end
  end

  defp create_recipe(_) do
    recipe = recipe_fixture()
    %{recipe: recipe}
  end
end
