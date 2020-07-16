defmodule DazzleWeb.TickerLive do
  use DazzleWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def render(assigns) do
    ~L"""
    <h1>Dazzle count: <%= @count %> </h1>
    """
  end

end
