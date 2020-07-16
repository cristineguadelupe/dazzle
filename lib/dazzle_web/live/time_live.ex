defmodule DazzleWeb.TimeLive do
  use DazzleWeb, :live_view

  def mount(_params, _session, socket) do
    :timer.send_interval(1000, self(), :tick)
    {:ok, assign(socket, time: now())}
  end

  def render(assigns) do
    ~L"""
    <h1>Time now: <%= @time %> </h1>
    """
  end

  def now do
    Time.truncate(Time.utc_now(), :second)
  end

  defp inc(socket) do
    assign(socket, time: now())
  end

  def handle_info(:tick, socket) do
    {:noreply, inc(socket)}
  end

end
