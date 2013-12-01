defmodule Sample.LoggingFilter do

  def start_link do
    case :gen_event.start_link({:local, __MODULE__}) do
      { :ok, pid } ->
        Fluent.add(Sample.LoggingFilter, nil)
        { :ok, pid }
      error ->
        error
    end
  end

  def finalize(conn) do
    Fluent.post(__MODULE__, "access", make_data(conn))
    conn
  end

  defp make_data(conn) do
    [
     status: conn.status,
     method: conn.method,
     host: conn.host,
     path: conn.path,
     peer: conn.peer |> convert_peer,
    ]
  end

  defp convert_peer({a, b, c, d}), do: "#{a}.#{b}.#{c}.#{d}"
  defp convert_peer({a, b, c, d, e, f}), do: "#{a}.#{b}.#{c}.#{d}.#{e}.#{f}"
  defp convert_peer(_), do: nil
end
