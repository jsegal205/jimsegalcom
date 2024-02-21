defmodule Jimsegalcom.Recipes.Recipe do
  @moduledoc """
  Recipe struct
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field :directions, :string
    field :title, :string
    field :ingredients, :string
    field :reference_link, :string
    field :notes, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :directions, :ingredients, :slug, :reference_link, :notes])
    |> validate_required([:title, :directions, :ingredients, :slug])
    |> unique_constraint([:slug])
  end
end
