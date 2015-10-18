defmodule Chucky.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: {:global, __MODULE__})
  end

  def init(:ok) do
    children = [
      worker(Chucky.Server, [])
    ]

    supervise(children, strategy: :one_for_one)
  end

end
