defmodule ProductWeb.DeviceLive.Index do
  use ProductWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Product.Devices.subscribe()
    {:ok, assign(socket, :devices, todos()), temporary_assigns: [devices: []]}
  end

  def todos() do
    Product.Devices.list_devices()
  end

  defp apply_actions(socket, :index, _) do
    # IO.inspect("index")
    # IO.inspect(socket)

    socket
    |> assign(:page_title, "list device")
    |> assign(:devices, socket.assigns.devices)
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_actions(socket, socket.assigns.live_action, params)}
  end

  @impl true
  def handle_info({:device_created, device}, socket) do
    # {:noreply, update(socket, :devices, fn devices -> [device | devices] end)}
    {:noreply, update(socket, :devices, &[device | &1])}
  end
end
