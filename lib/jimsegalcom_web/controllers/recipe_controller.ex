defmodule JimsegalcomWeb.RecipeController do
  use JimsegalcomWeb, :controller

  alias JimsegalcomWeb.NavRoutes
  alias Jimsegalcom.Recipes
  alias Jimsegalcom.Recipes.Recipe

  def index(conn, _params) do
    recipes = Recipes.list_recipes()
    assigns = NavRoutes.put_link([recipes: recipes], :recipe)

    render(conn, :index, assigns)
  end

  def new(conn, _params) do
    changeset = Recipes.change_recipe(%Recipe{})
    assigns = NavRoutes.put_link([changeset: changeset], :recipe)
    render(conn, :new, assigns)
  end

  def create(conn, %{"recipe" => recipe_params}) do
    case Recipes.create_recipe(recipe_params) do
      {:ok, recipe} ->
        conn
        |> put_flash(:info, "Recipe created successfully.")
        |> redirect(to: ~p"/recipes/#{recipe}")

      {:error, %Ecto.Changeset{} = changeset} ->
        assigns = NavRoutes.put_link([changeset: changeset], :recipe)
        render(conn, :new, assigns)
    end
  end

  def show(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)
    assigns = NavRoutes.put_link([recipe: recipe], :recipe)

    render(conn, :show, assigns)
  end

  def edit(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)
    changeset = Recipes.change_recipe(recipe)
    assigns = NavRoutes.put_link([recipe: recipe, changeset: changeset], :recipe)

    render(conn, :edit, assigns)
  end

  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    recipe = Recipes.get_recipe!(id)

    case Recipes.update_recipe(recipe, recipe_params) do
      {:ok, recipe} ->
        conn
        |> put_flash(:info, "Recipe updated successfully.")
        |> redirect(to: ~p"/recipes/#{recipe}")

      {:error, %Ecto.Changeset{} = changeset} ->
        assigns = NavRoutes.put_link([recipe: recipe, changeset: changeset], :recipe)
        render(conn, :edit, assigns)
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)
    {:ok, _recipe} = Recipes.delete_recipe(recipe)

    conn
    |> put_flash(:info, "Recipe deleted successfully.")
    |> redirect(to: ~p"/recipes")
  end
end
