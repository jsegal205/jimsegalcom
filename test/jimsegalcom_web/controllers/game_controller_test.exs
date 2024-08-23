defmodule JimsegalcomWeb.GameControllerTest do
  use JimsegalcomWeb.ConnCase

  import Jimsegalcom.GamesFixtures

  @create_attrs %{name: "some name", url: "some url", image_url: "some image_url", bgg_id: 42}
  @update_attrs %{
    name: "some updated name",
    url: "some updated url",
    image_url: "some updated image_url",
    bgg_id: 43
  }
  @invalid_attrs %{name: nil, url: nil, image_url: nil, bgg_id: nil}

  describe "index" do
    test "lists all games", %{conn: conn} do
      conn = get(conn, ~p"/games")
      assert html_response(conn, 200) =~ "Listing Games"
    end

    test "lists games by search param", %{conn: conn} do
      create_game(%{name: "game one"})
      create_game(%{name: "game two"})

      conn = get(conn, ~p"/games", search: "game one")

      assert html_response(conn, 200) =~ "game one"
      refute html_response(conn, 200) =~ "game two"
    end
  end

  describe "new game" do
    @tag :skip
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/games/new")
      assert html_response(conn, 200) =~ "New Game"
    end
  end

  describe "create game" do
    @tag :skip
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/games", game: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/games/#{id}"

      conn = get(conn, ~p"/games/#{id}")
      assert html_response(conn, 200) =~ "Game #{id}"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/games", game: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Game"
    end
  end

  describe "edit game" do
    setup [:create_game]
    @tag :skip
    test "renders form for editing chosen game", %{conn: conn, game: game} do
      conn = get(conn, ~p"/games/#{game}/edit")
      assert html_response(conn, 200) =~ "Edit Game"
    end
  end

  describe "update game" do
    setup [:create_game]
    @tag :skip
    test "redirects when data is valid", %{conn: conn, game: game} do
      conn = put(conn, ~p"/games/#{game}", game: @update_attrs)
      assert redirected_to(conn) == ~p"/games/#{game}"

      conn = get(conn, ~p"/games/#{game}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn, game: game} do
      conn = put(conn, ~p"/games/#{game}", game: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Game"
    end
  end

  describe "delete game" do
    setup [:create_game]
    @tag :skip
    test "deletes chosen game", %{conn: conn, game: game} do
      conn = delete(conn, ~p"/games/#{game}")
      assert redirected_to(conn) == ~p"/games"

      assert_error_sent 404, fn ->
        get(conn, ~p"/games/#{game}")
      end
    end
  end

  defp create_game(attrs) do
    game = game_fixture(attrs)
    %{game: game}
  end
end
