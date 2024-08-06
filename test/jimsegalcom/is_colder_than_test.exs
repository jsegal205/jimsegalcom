defmodule Jimsegalcom.IsColderThanTest do
  use ExUnit.Case, async: true
  use Jimsegalcom.DataCase

  import Mox

  alias Jimsegalcom.IsColderThan

  describe "check/2" do
    setup :verify_on_exit!

    test "on successful api calls returns map" do
      expect(Jimsegalcom.MockWeatherApi, :current_temp, fn [lat: _, lon: _] ->
        {:ok, %{current_temp: 1}}
      end)

      expect(Jimsegalcom.MockWeatherApi, :current_temp, fn [lat: _, lon: _] ->
        {:ok, %{current_temp: 2}}
      end)

      assert %{
               is_colder_than: true,
               current_temp1: 1,
               current_temp2: 2
             } == IsColderThan.check(%{lat: 1, lon: 1}, %{lat: 2, lon: 2})
    end

    test "on failed api calls returns map" do
      expect(Jimsegalcom.MockWeatherApi, :current_temp, fn [lat: _, lon: _] ->
        {:error, "something went wrong"}
      end)

      assert %{
               current_temp1: "unknown",
               current_temp2: "unknown",
               is_colder_than: "unknown"
             } == IsColderThan.check(%{lat: 1, lon: 1}, %{lat: 2, lon: 2})
    end
  end
end
