defmodule Jimsegalcom.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :ingredients, :text
      add :directions, :text
      add :notes, :text
      add :reference_link, :string
      add :slug, :string

      timestamps()
    end

    create index(:recipes, :slug, unique: true)
  end
end
