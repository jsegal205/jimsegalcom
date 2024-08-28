defmodule JimsegalcomWeb.Games do
  @moduledoc """
  Context for components specific to Games
  """
  use Phoenix.Component

  attr :name, :string, default: ""
  attr :url, :string, default: ""
  attr :image_url, :string, default: ""

  def game_card(assigns) do
    ~H"""
    <a class="flex flex-col align-center border-black rounded border-2 w-[225px] m-3 p-4" href={@url}>
      <h3>
        <%= @name %>
      </h3>

      <img src={@image_url} alt="{@name} Cover Artwork" class="max-h-[200px] max-w-[200px] mt-2" />
    </a>
    """
  end
end
