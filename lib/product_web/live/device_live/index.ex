defmodule ProductWeb.DeviceLive.Index do
  use ProductWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :devices, todos()), temporary_assigns: [devices: []]}
  end

  def todos() do
    Product.Devices.list_devices()
  end

  defp apply_actions(socket, :index, _) do
    IO.inspect("index")
    IO.inspect(socket)

    socket
    |> assign(:page_title, "list device")
    |> assign(:devices, nil)
  end
end
