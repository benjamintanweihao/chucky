defmodule Chucky do
  use Application
  require Logger

  def start(_type, _args) do
    Chucky.Supervisor.start_link
  end

  def fact do
    Chucky.Server.fact
  end

end
