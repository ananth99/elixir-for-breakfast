defmodule AccountManager do
  use GenServer

  ## Client implementation

  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  def withdraw(server,amount) do
    GenServer.call(server,{:withdraw, amount})
  end

  def deposit(server, amount) do
    GenServer.call(server, {:deposit, amount})
  end

  def get_balance(server) do
    GenServer.call(server,{:balance})
  end

  ## Server
  def init(:ok) do
    balance = 0
    {:ok, balance}
  end

  def handle_call({:withdraw, amount}, _from, balance) do
    cond do
      amount > balance ->
        raise "raising this"
        {:reply, "Not enough balance!", balance}
      true ->
        balance = balance - amount
        {:reply, "success", balance}
    end
  end

  def handle_call({:deposit, amount}, _from, balance) do
    balance = balance + amount
    {:reply, "success", balance}
  end

  def handle_call({:balance},_from, balance) do
    {:reply, "current_balance: #{balance}",balance}
  end
end
