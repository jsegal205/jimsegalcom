defmodule JimsegalcomWeb.GameHTML do
  use JimsegalcomWeb, :html

  import JimsegalcomWeb.Games

  embed_templates "game_html/*"

  @doc """
  Renders a game form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def game_form(assigns)
end
