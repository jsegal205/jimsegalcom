defmodule Jimsegalcom.Games.Game do
  @moduledoc """
  Game struct
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :name, :string
    field :url, :string
    field :image_url, :string
    field :bgg_id, :integer

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :url, :image_url, :bgg_id])
    |> validate_required([:name, :url, :image_url, :bgg_id])
  end
end
