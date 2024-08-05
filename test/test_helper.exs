Mox.defmock(Jimsegalcom.MockWeatherApi, for: Jimsegalcom.WeatherApi)
Application.put_env(:jimsegalcom, :weather, Jimsegalcom.MockWeatherApi)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Jimsegalcom.Repo, :manual)
