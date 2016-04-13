defmodule BotHub.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bot_hub,
      version: "0.0.1",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
    ]
  end

  def application do
    [
      applications: [:logger, :cowboy, :plug, :gproc],
      mod: {BotHub, []}
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:plug, "~> 1.0"},
      {:gproc, "0.5.0"}
    ]
  end
end
