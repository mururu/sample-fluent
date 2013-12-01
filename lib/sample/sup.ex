defmodule Sample.Sup do
  use Supervisor.Behaviour

  def start_link(_) do
    :supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      worker(Sample.LoggingFilter, [], id: Sample.LoggingFilter),
      supervisor(Sample.Dynamo, [[max_restarts: 5, max_seconds: 5]]),
    ]

    supervise(children, strategy: :one_for_one)
  end
end
