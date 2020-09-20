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
    socket
    |> assign(:page_title, "list device")
    |> assign(:devices, socket.assigns.devices)
  end

  defp apply_actions(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit device")
    |> assign(:device, Product.Devices.get_device!(id))

    # IO.inspect(socket)
    # socket
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
