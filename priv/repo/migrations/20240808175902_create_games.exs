defmodule Jimsegalcom.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :name, :string
      add :url, :string
      add :image_url, :string
      add :bgg_id, :integer

      timestamps()
    end
  end
end
