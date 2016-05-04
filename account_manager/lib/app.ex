defmodule App do
  use Application

  def start(_type,_args) do
    AccountManagerSupervisor.start_link
  end
end
