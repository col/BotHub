ExUnit.start()

case BotHub.Bot.find_bot("SampleBot") do
  :undefined -> SampleBot.Worker.start_link()
  _ -> nil
end
