defmodule Sample.Mixfile do
  use Mix.Project

  def project do
    [ app: :sample,
      version: "0.0.1",
      build_per_environment: true,
      dynamos: [Sample.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { Sample, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "~> 0.1.0-dev", github: "elixir-lang/dynamo" },
      { :fluent, github: "mururu/fluent-logger-elixir"}]
  end
end
