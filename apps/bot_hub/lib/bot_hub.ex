defmodule BotHub do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(__MODULE__, [], function: :run),
    ]

    opts = [strategy: :one_for_one, name: BotHub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def run do
    {:ok, _} = Plug.Adapters.Cowboy.http BotHub.Router, [], port: 5000
  end
end
