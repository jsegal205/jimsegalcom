defmodule Jimsegalcom.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Jimsegalcom.Accounts` context.
  """

  alias Ecto.Adapters.SQL
  alias Jimsegalcom.Repo

  def unique_user_email, do: "user#{System.unique_integer()}@example.com"
  def valid_user_password, do: "hello world!"

  def valid_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_user_email(),
      password: valid_user_password()
    })
  end

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> valid_user_attributes()
      |> Jimsegalcom.Accounts.register_user()

    user
  end

  def active_user_fixture(attrs \\ %{}) do
    # future me, I did this so that I could restrict users interact with the
    # site to those that you only updated `is_active` via direct DB update.

    # past me apologizes for some amount of time that I work through racking my
    # brain figuring out wtf I was doing.
    user = user_fixture(attrs)

    {:ok, _} =
      SQL.query(Repo, "UPDATE users SET is_active = $1 WHERE id = $2", [
        true,
        user.id
      ])

    user
  end

  def extract_user_token(fun) do
    {:ok, captured_email} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token | _] = String.split(captured_email.text_body, "[TOKEN]")
    token
  end
end
