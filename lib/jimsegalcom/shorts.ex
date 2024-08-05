defmodule Jimsegalcom.Shorts do
  @moduledoc """
  The Shorts Context
  """

  alias Jimsegalcom.Weather

  def being_worn?(datetime \\ DateTime.utc_now()) do
    with {:ok, %{max_temp: temp}} <- Weather.get_chicago_max_temp(),
         date <- get_datetime_in_chicago(datetime) do
      %{
        probability: calculate(temp, date),
        criteria: [
          %{label: "Max temperature today", value: "#{temp} °F"},
          %{
            label: "Current date",
            value:
              date
              |> DateTime.to_date()
              |> Calendar.strftime("%B %d, %Y")
          }
        ]
      }
    else
      _ ->
        %{
          probability: "unknown",
          criteria: [%{label: "there was an error calculating probability", value: ""}]
        }
    end
  end

  defp get_datetime_in_chicago(datetime) do
    DateTime.shift_zone!(datetime, "America/Chicago")
  end

  defp calculate(temp, %{month: month} = _date) do
    case temperature_probability(temp) + date_probability(month) do
      p when p > 100 -> 99
      p when p < 1 -> 1
      p -> p
    end
  end

  defp temperature_probability(t) when t > 80, do: 1000
  defp temperature_probability(t) when t > 65, do: 95
  defp temperature_probability(t) when t < 55, do: -47
  defp temperature_probability(_t), do: 50

  # dates are month numbers, zero indexed
  # jan, feb, nov, dec
  defp date_probability(d) when d in [0, 1, 10, 11], do: -62
  # march, oct
  defp date_probability(d) when d in [2, 9], do: 15
  # april, sept
  defp date_probability(d) when d in [3, 8], do: 22
  # may, june, july, aug
  defp date_probability(d) when d in [3, 8], do: 67
  # something else returned (new month created in the future)
  defp date_probability(_d), do: 0
end
