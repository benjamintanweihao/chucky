defmodule Chucky do
  use Application
  require Logger

  def start(:normal, _args) do
    Chucky.Supervisor.start_link
  end

  def start(:takeover, _args) do
    Logger.debug "#{self} taking over ..."
    Chucky.Supervisor.start_link
  end

  def fact do
    Chucky.Server.fact
  end

end
