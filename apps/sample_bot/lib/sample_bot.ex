defmodule SampleBot do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [worker(SampleBot.Worker, [])]

    opts = [strategy: :one_for_one, name: SampleBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
