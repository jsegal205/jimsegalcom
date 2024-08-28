defmodule Jimsegalcom.IsColderThanTest do
  use ExUnit.Case, async: true
  use Jimsegalcom.DataCase

  import Mox

  alias Jimsegalcom.IsColderThan

  describe "check_chicago_vs_anchorage/0" do
    setup :verify_on_exit!

    test "on successful api calls returns map" do
      expect(Jimsegalcom.MockWeatherApi, :current_temp, fn [lat: 41.878114, lon: -87.629798] ->
        {:ok, %{current_temp: 1}}
      end)

      expect(Jimsegalcom.MockWeatherApi, :current_temp, fn [lat: 61.2175, lon: -149.8584] ->
        {:ok, %{current_temp: 2}}
      end)

      assert %{
               is_colder_than: "YUP",
               chicago_temp: 1,
               anchorage_temp: 2
             } == IsColderThan.check_chicago_vs_anchorage()
    end

    test "on failed api calls returns map" do
      expect(Jimsegalcom.MockWeatherApi, :current_temp, fn [lat: 41.878114, lon: -87.629798] ->
        {:error, "something went wrong"}
      end)

      assert %{
               chicago_temp: "unknown",
               anchorage_temp: "unknown",
               is_colder_than: "¯\\_(ツ)_/¯"
             } == IsColderThan.check_chicago_vs_anchorage()
    end
  end

  describe "check/2" do
    setup :verify_on_exit!

    test "on successful api calls returns map" do
      expect(Jimsegalcom.MockWeatherApi, :current_temp, fn [lat: _, lon: _] ->
        {:ok, %{current_temp: 2}}
      end)

      expect(Jimsegalcom.MockWeatherApi, :current_temp, fn [lat: _, lon: _] ->
        {:ok, %{current_temp: 1}}
      end)

      assert %{
               is_colder_than: "Nope",
               current_temp1: 2,
               current_temp2: 1
             } == IsColderThan.check(%{lat: 1, lon: 1}, %{lat: 2, lon: 2})
    end

    test "on failed api calls returns map" do
      expect(Jimsegalcom.MockWeatherApi, :current_temp, fn [lat: _, lon: _] ->
        {:error, "something went wrong"}
      end)

      assert %{
               current_temp1: "unknown",
               current_temp2: "unknown",
               is_colder_than: "¯\\_(ツ)_/¯"
             } == IsColderThan.check(%{lat: 1, lon: 1}, %{lat: 2, lon: 2})
    end
  end
end
