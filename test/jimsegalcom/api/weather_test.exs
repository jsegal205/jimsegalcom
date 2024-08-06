defmodule Jimsegalcom.Api.WeatherTest do
  use ExUnit.Case, async: true
  use Jimsegalcom.DataCase

  import ExUnit.CaptureLog

  alias Jimsegalcom.Api.Weather
  alias Req

  describe "max_temp/1" do
    @bad_request_msg "`lat` or `lon` params missing"

    test "errors when no opts passed" do
      assert capture_log([level: :error], fn ->
               assert Weather.max_temp() == {:error, @bad_request_msg}
             end) =~ @bad_request_msg
    end

    test "errors when no lat passed" do
      assert capture_log([level: :error], fn ->
               assert Weather.max_temp(lon: 1) == {:error, @bad_request_msg}
             end) =~ @bad_request_msg
    end

    test "errors when no lon passed" do
      assert capture_log([level: :error], fn ->
               assert Weather.max_temp(lat: 1) == {:error, @bad_request_msg}
             end) =~ @bad_request_msg
    end

    test "calls api" do
      Req.Test.stub(Weather, fn conn ->
        Req.Test.json(conn, %{"list" => [%{"temp" => %{"max" => 34.56}}]})
      end)

      assert Weather.max_temp(lat: 1, lon: 2) == {:ok, %{max_temp: 34.56}}
    end
  end

  describe "current_temp/1" do
    @bad_request_msg "`lat` or `lon` params missing"

    test "errors when no opts passed" do
      assert capture_log([level: :error], fn ->
               assert Weather.current_temp() == {:error, @bad_request_msg}
             end) =~ @bad_request_msg
    end

    test "errors when no lat passed" do
      assert capture_log([level: :error], fn ->
               assert Weather.current_temp(lon: 1) == {:error, @bad_request_msg}
             end) =~ @bad_request_msg
    end

    test "errors when no lon passed" do
      assert capture_log([level: :error], fn ->
               assert Weather.current_temp(lat: 1) == {:error, @bad_request_msg}
             end) =~ @bad_request_msg
    end

    test "calls api" do
      Req.Test.stub(Weather, fn conn ->
        Req.Test.json(conn, %{"main" => %{"temp" => 34.56}})
      end)

      assert Weather.current_temp(lat: 1, lon: 2) == {:ok, %{current_temp: 34.56}}
    end
  end
end
