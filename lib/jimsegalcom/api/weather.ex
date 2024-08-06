defmodule Jimsegalcom.Api.Weather do
  @moduledoc """
  Interface module with OpenWeatherMap API
  """
  require Logger

  @spec max_temp(keyword()) :: {:ok, map()} | {:error, binary()}
  def max_temp(opts \\ []) do
    case {Keyword.fetch(opts, :lat), Keyword.fetch(opts, :lon)} do
      {{:ok, _}, {:ok, _}} ->
        opts = Keyword.merge(opts, cnt: 1)

        "/forecast/daily"
        |> make_url()
        |> make_request(opts)

      _ ->
        Logger.error("`lat` or `lon` params missing")
        {:error, "`lat` or `lon` params missing"}
    end
  end

  @spec max_temp(keyword()) :: {:ok, map()} | {:error, binary()}
  def current_temp(opts \\ []) do
    case {Keyword.fetch(opts, :lat), Keyword.fetch(opts, :lon)} do
      {{:ok, _}, {:ok, _}} ->
        "/weather"
        |> make_url()
        |> make_request(opts)

      _ ->
        Logger.error("`lat` or `lon` params missing")
        {:error, "`lat` or `lon` params missing"}
    end
  end

  defp make_request(url, opts) do
    case perform(url, opts) do
      {:ok, %{status: 200, body: body} = _resp} ->
        {:ok, format_resp(body)}

      {:error, _} ->
        Logger.error("An error occurred while calling weather API")
        {:error, "An error occurred while calling weather API"}
    end
  end

  defp perform(url, opts) do
    [
      base_url: url,
      params: Keyword.merge([appid: api_key(), units: "imperial"], opts)
    ]
    |> Keyword.merge(Application.get_env(:jimsegalcom, :weather_req_options, []))
    |> Req.request()
  end

  defp base_url(), do: URI.new!("https://api.openweathermap.org/data/2.5/")
  defp api_key(), do: Application.get_env(:jimsegalcom, :openweathermap_api_key, [])

  defp make_url(path) do
    base_url()
    |> URI.append_path(path)
    |> URI.to_string()
  end

  # max temp response
  defp format_resp(%{"list" => [%{"temp" => %{"max" => max_temp}}]}) do
    %{max_temp: max_temp}
  end

  # current temp response
  defp format_resp(%{"main" => %{"temp" => current_temp}}) do
    %{current_temp: current_temp}
  end
end
