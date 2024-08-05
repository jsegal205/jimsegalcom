defmodule Jimsegalcom.Weather do
  @moduledoc """
  Context module to get weather information
  """
  alias Jimsegalcom.WeatherApi

  def get_chicago_max_temp() do
    get_max_temp(41.878114, -87.629798)
  end

  def get_anchorage_max_temp() do
    get_max_temp(61.2175, -149.8584)
  end

  def get_max_temp(lat, lon) do
    WeatherApi.max_temp(lat: lat, lon: lon)
  end
end
