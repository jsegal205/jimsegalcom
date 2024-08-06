defmodule Jimsegalcom.WeatherApi do
  @moduledoc """
  Weather API interface.

  Used to make mocking tests easier.
  """

  alias Jimsegalcom.Api.Weather

  @callback max_temp(keyword()) :: {:ok, map()}
  @spec max_temp(keyword()) :: {:error, binary()} | {:ok, map()}
  def max_temp(opts \\ []), do: impl().max_temp(opts)

  @callback current_temp(keyword()) :: {:ok, map()}
  @spec current_temp(keyword()) :: {:error, binary()} | {:ok, map()}
  def current_temp(opts \\ []), do: impl().current_temp(opts)

  defp impl, do: Application.get_env(:jimsegalcom, :weather, Weather)
end
