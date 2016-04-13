defmodule SampleBot.Worker do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, "SampleBot")
  end

  def init(name) do
    :gproc.reg({:n, :l, {:bot, name}})
    {:ok, []}
  end

  def handle_cast({:handle_message, message}, state) do
    IO.puts "SampleBot - Received message: #{message}"
    {:noreply, state}
  end

end
