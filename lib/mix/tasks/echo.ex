defmodule Mix.Tasks.Echo do
  @moduledoc "Printed when the user requests `mix help echo`"
  @shortdoc "Echoes arguments"

  use Mix.Task
  require Logger

  @impl Mix.Task
  def run(args) do
    Logger.warning("echo task #{Enum.join(args, " ")}")
    Mix.shell().info(Enum.join(args, " "))
  end
end
