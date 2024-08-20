defmodule Jimsegalcom.GamesTest do
  use Jimsegalcom.DataCase

  alias Jimsegalcom.Games

  describe "games" do
    alias Jimsegalcom.Games.Game

    import Jimsegalcom.GamesFixtures

    @invalid_attrs %{name: nil, url: nil, image_url: nil, bgg_id: nil}

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Games.list_games() == [%{name: game.name, url: game.url, image_url: game.image_url}]
    end

    test "list_games/0 returns games ordered by name" do
      game_b = game_fixture(%{name: "b"})
      game_a = game_fixture(%{name: "a"})

      assert Games.list_games() == [
               %{name: game_a.name, url: game_a.url, image_url: game_a.image_url},
               %{name: game_b.name, url: game_b.url, image_url: game_b.image_url}
             ]
    end

    test "list_games/1 returns filtered games by name" do
      game_a = game_fixture(%{name: "a"})
      _game_b = game_fixture(%{name: "b"})

      assert Games.list_games(search: "a") == [
               %{name: game_a.name, url: game_a.url, image_url: game_a.image_url}
             ]
    end

    test "list_games/1 returns filtered games by name via contains clause" do
      game_a = game_fixture(%{name: "apple"})
      _game_b = game_fixture(%{name: "beet"})

      assert Games.list_games(search: "a") == [
               %{name: game_a.name, url: game_a.url, image_url: game_a.image_url}
             ]
    end

    test "list_games/1 returns filtered games by name case insensitive game name" do
      game_a = game_fixture(%{name: "APPLE"})
      _game_b = game_fixture(%{name: "beet"})

      assert Games.list_games(search: "a") == [
               %{name: game_a.name, url: game_a.url, image_url: game_a.image_url}
             ]
    end

    test "list_games/1 returns filtered games by name case insensitive search term" do
      game_a = game_fixture(%{name: "apple"})
      _game_b = game_fixture(%{name: "beet"})

      assert Games.list_games(search: "A") == [
               %{name: game_a.name, url: game_a.url, image_url: game_a.image_url}
             ]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Games.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = %{name: "some name", url: "some url", image_url: "some image_url", bgg_id: 42}

      assert {:ok, %Game{} = game} = Games.create_game(valid_attrs)
      assert game.name == "some name"
      assert game.url == "some url"
      assert game.image_url == "some image_url"
      assert game.bgg_id == 42
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()

      update_attrs = %{
        name: "some updated name",
        url: "some updated url",
        image_url: "some updated image_url",
        bgg_id: 43
      }

      assert {:ok, %Game{} = game} = Games.update_game(game, update_attrs)
      assert game.name == "some updated name"
      assert game.url == "some updated url"
      assert game.image_url == "some updated image_url"
      assert game.bgg_id == 43
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_game(game, @invalid_attrs)
      assert game == Games.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Games.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Games.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Games.change_game(game)
    end
  end
end
