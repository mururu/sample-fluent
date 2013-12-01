defmodule Sample do
  use Application.Behaviour

  def start(_type, _args) do
    Sample.Sup.start_link([])
  end
end
