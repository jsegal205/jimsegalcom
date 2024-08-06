defmodule Jimsegalcom.Weather do
  @moduledoc """
  Context module to get weather information
  """
  alias Jimsegalcom.WeatherApi

  @chicago_coords %{lat: 41.878114, lon: -87.629798}
  @anchorage_coords %{lat: 61.2175, lon: -149.8584}

  def get_chicago_max_temp() do
    get_max_temp(@chicago_coords.lat, @chicago_coords.lon)
  end

  def get_anchorage_max_temp() do
    get_max_temp(@anchorage_coords.lat, @anchorage_coords.lon)
  end

  def get_max_temp(lat, lon) do
    WeatherApi.max_temp(lat: lat, lon: lon)
  end

  def get_chicago_current_temp() do
    get_current_temp(@chicago_coords.lat, @chicago_coords.lon)
  end

  def get_anchorage_current_temp() do
    get_current_temp(@anchorage_coords.lat, @anchorage_coords.lon)
  end

  def get_current_temp(lat, lon) do
    WeatherApi.current_temp(lat: lat, lon: lon)
  end
end
