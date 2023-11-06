defmodule Jimsegalcom.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :description, :text
      add :ingredients, :text
      add :notes, :text
      add :reference_link, :string
      add :slug, :string

      timestamps()
    end

    create index(:recipes, :slug, unique: true)
  end
end
