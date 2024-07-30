defmodule Jimsegalcom.Api.Weather do
  require Logger

  @spec max_temp(keyword()) :: {:ok, map()} | {:error, binary()}
  def max_temp(opts \\ []) do
    case {Keyword.fetch(opts, :lat), Keyword.fetch(opts, :lon)} do
      {{:ok, _}, {:ok, _}} ->
        make_request(opts)

      _ ->
        Logger.error("`lat` or `lon` params missing")
        {:error, "`lat` or `lon` params missing"}
    end
  end

  defp make_request(opts) do
    case perform(opts) do
      {:ok, %{status: 200, body: body} = _resp} ->
        {:ok, format_resp(body)}

      {:error, error} ->
        Logger.error("An error occurred while calling weather API", error: error)
        :error
    end
  end

  defp perform(opts) do
    params =
      [appid: api_key(), cnt: 1, units: "imperial"]
      |> Keyword.merge(opts)

    [
      base_url: "https://api.openweathermap.org/data/2.5/forecast/daily",
      params: params
    ]
    |> Keyword.merge(Application.get_env(:jimsegalcom, :weather_req_options, []))
    |> Req.request()
  end

  defp api_key(), do: Application.get_env(:jimsegalcom, :openweathermap_api_key, [])

  defp format_resp(%{"list" => [%{"temp" => %{"max" => max_temp}}]}) do
    %{max_temp: max_temp}
  end
end
