defmodule JimsegalcomWeb.GameController do
  use JimsegalcomWeb, :controller

  alias Jimsegalcom.Games
  alias Jimsegalcom.Games.Game

  alias JimsegalcomWeb.NavRoutes

  def index(conn, params) do
    games =
      params
      |> apply_params()
      |> Games.list_games()

    assigns =
      NavRoutes.put_link([games: games], :projects)

    render(conn, :index, assigns)
  end

  def new(conn, _params) do
    changeset = Games.change_game(%Game{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"game" => game_params}) do
    case Games.create_game(game_params) do
      {:ok, game} ->
        conn
        |> put_flash(:info, "Game created successfully.")
        |> redirect(to: ~p"/games/#{game}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    game = Games.get_game!(id)
    render(conn, :show, game: game)
  end

  def edit(conn, %{"id" => id}) do
    game = Games.get_game!(id)
    changeset = Games.change_game(game)
    render(conn, :edit, game: game, changeset: changeset)
  end

  def update(conn, %{"id" => id, "game" => game_params}) do
    game = Games.get_game!(id)

    case Games.update_game(game, game_params) do
      {:ok, game} ->
        conn
        |> put_flash(:info, "Game updated successfully.")
        |> redirect(to: ~p"/games/#{game}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, game: game, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    game = Games.get_game!(id)
    {:ok, _game} = Games.delete_game(game)

    conn
    |> put_flash(:info, "Game deleted successfully.")
    |> redirect(to: ~p"/games")
  end

  defp apply_params(%{"search" => search}), do: [search: search]
  defp apply_params(_), do: []
end
