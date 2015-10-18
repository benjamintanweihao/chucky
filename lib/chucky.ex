defmodule Chucky do
  use Application
  require Logger

  def start(type, _args) do
    import Supervisor.Spec
    children = [
      worker(Chucky.Server, [])
    ]

    case type do
      {:takeover, old_node} ->
        Logger.info("#{node} is taking over #{old_node}")

      _ ->
        Logger.info("#{node} starting distributed")
    end

    opts = [strategy: :one_for_one, name: {:global, Chucky.Supervisor}]
    Supervisor.start_link(children, opts)
  end

  def fact do
    Chucky.Server.fact
  end

end
