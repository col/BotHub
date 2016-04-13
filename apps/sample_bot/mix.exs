defmodule SampleBot.Mixfile do
  use Mix.Project

  def project do
    [app: :sample_bot,
     version: "0.0.1",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger, :gproc],
      mod: {SampleBot, []}
    ]
  end

  defp deps do
    [
      {:gproc, "0.5.0"}
    ]
  end
end
