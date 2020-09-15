defmodule ProductWeb.DeviceLive.Index do
  use ProductWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :devices, todos()), temporary_assigns: [devices: []]}
  end

  def todos() do
    []
  end
end
