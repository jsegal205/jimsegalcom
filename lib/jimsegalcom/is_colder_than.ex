defmodule Jimsegalcom.IsColderThan do
  @moduledoc """
  Context for verifying if one lat lon coords are colder than another
  """
  alias Jimsegalcom.WeatherApi

  @typep coord :: %{lat: float(), lon: float()}
  @typep check_result :: %{
           is_colder_than: binary(),
           current_temp1: binary(),
           current_temp2: binary()
         }

  @spec check(coord(), coord()) :: check_result()
  def check(%{lat: lat1, lon: lon1}, %{lat: lat2, lon: lon2}) do
    # FUTURE idea, save results to db table.
    # This will allow to cache based on timing and also look up historical info

    with {:ok, %{current_temp: current_temp1}} <-
           WeatherApi.current_temp(lat: lat1, lon: lon1),
         {:ok, %{current_temp: current_temp2}} <-
           WeatherApi.current_temp(lat: lat2, lon: lon2) do
      %{
        is_colder_than: current_temp1 < current_temp2,
        current_temp1: current_temp1,
        current_temp2: current_temp2
      }
    else
      _ ->
        %{
          is_colder_than: "unknown",
          current_temp1: "unknown",
          current_temp2: "unknown"
        }
    end
  end
end
