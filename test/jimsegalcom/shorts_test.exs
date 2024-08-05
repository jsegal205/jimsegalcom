defmodule Jimsegalcom.ShortsTest do
  use ExUnit.Case, async: true
  use Jimsegalcom.DataCase

  import Mox

  alias Jimsegalcom.Shorts

  describe "being_worn/0" do
    setup :verify_on_exit!

    @test_cases [
      %{input: %{month: 1, temp: 54}, expected_probability: 1},
      %{input: %{month: 1, temp: 60}, expected_probability: 1},
      %{input: %{month: 1, temp: 66}, expected_probability: 33},
      %{input: %{month: 1, temp: 81}, expected_probability: 99},
      # feb
      %{input: %{month: 2, temp: 54}, expected_probability: 1},
      %{input: %{month: 2, temp: 60}, expected_probability: 65},
      %{input: %{month: 2, temp: 66}, expected_probability: 99},
      %{input: %{month: 2, temp: 81}, expected_probability: 99},
      # march
      %{input: %{month: 3, temp: 54}, expected_probability: 1},
      %{input: %{month: 3, temp: 60}, expected_probability: 72},
      %{input: %{month: 3, temp: 66}, expected_probability: 99},
      %{input: %{month: 3, temp: 81}, expected_probability: 99},
      # april
      %{input: %{month: 4, temp: 54}, expected_probability: 1},
      %{input: %{month: 4, temp: 60}, expected_probability: 50},
      %{input: %{month: 4, temp: 66}, expected_probability: 95},
      %{input: %{month: 4, temp: 81}, expected_probability: 99},
      # may
      %{input: %{month: 5, temp: 54}, expected_probability: 1},
      %{input: %{month: 5, temp: 60}, expected_probability: 50},
      %{input: %{month: 5, temp: 66}, expected_probability: 95},
      %{input: %{month: 5, temp: 81}, expected_probability: 99},
      # june
      %{input: %{month: 6, temp: 54}, expected_probability: 1},
      %{input: %{month: 6, temp: 60}, expected_probability: 50},
      %{input: %{month: 6, temp: 66}, expected_probability: 95},
      %{input: %{month: 6, temp: 81}, expected_probability: 99},
      # july
      %{input: %{month: 7, temp: 54}, expected_probability: 1},
      %{input: %{month: 7, temp: 60}, expected_probability: 50},
      %{input: %{month: 7, temp: 66}, expected_probability: 95},
      %{input: %{month: 7, temp: 81}, expected_probability: 99},
      # aug
      %{input: %{month: 8, temp: 54}, expected_probability: 1},
      %{input: %{month: 8, temp: 60}, expected_probability: 72},
      %{input: %{month: 8, temp: 66}, expected_probability: 99},
      %{input: %{month: 8, temp: 81}, expected_probability: 99},
      # sept
      %{input: %{month: 9, temp: 54}, expected_probability: 1},
      %{input: %{month: 9, temp: 60}, expected_probability: 65},
      %{input: %{month: 9, temp: 66}, expected_probability: 99},
      %{input: %{month: 9, temp: 81}, expected_probability: 99},
      # oct
      %{input: %{month: 10, temp: 54}, expected_probability: 1},
      %{input: %{month: 10, temp: 60}, expected_probability: 1},
      %{input: %{month: 10, temp: 66}, expected_probability: 33},
      %{input: %{month: 10, temp: 81}, expected_probability: 99},
      # nov
      %{input: %{month: 11, temp: 54}, expected_probability: 1},
      %{input: %{month: 11, temp: 60}, expected_probability: 1},
      %{input: %{month: 11, temp: 66}, expected_probability: 33},
      %{input: %{month: 11, temp: 81}, expected_probability: 99},
      # dec
      %{input: %{month: 12, temp: 54}, expected_probability: 1},
      %{input: %{month: 12, temp: 60}, expected_probability: 50},
      %{input: %{month: 12, temp: 66}, expected_probability: 95},
      %{input: %{month: 12, temp: 81}, expected_probability: 99}
    ]

    for %{input: input, expected_probability: expected_probability} <- @test_cases do
      @tag input: input, expected_probability: expected_probability
      test "month: #{input.month}, temp: #{input.temp}, expected: #{expected_probability}", %{
        input: input,
        expected_probability: expected_probability
      } do
        expect(Jimsegalcom.MockWeatherApi, :max_temp, fn [lat: _, lon: _] ->
          {:ok, %{max_temp: input.temp}}
        end)

        dt = DateTime.new!(Date.new!(2024, input.month, 1), Time.new!(12, 0, 0))

        assert %{probability: ^expected_probability} = Shorts.being_worn?(dt)
      end
    end
  end
end
