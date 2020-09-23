defmodule ProductWeb.DeviceLive.FormComponent do
  use ProductWeb, :live_component

  alias Product.Devices

  @impl true
  def update(%{device: device} = assigns, socket) do
    changeset = Devices.change_device(device)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"device" => device}, socket) do
    changeset =
      socket.assigns.device
      |> Devices.change_device(device)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, socket.assigns.action, device)}
  end

  @impl true
  def handle_event("save", %{"device" => device}, socket) do
  end
end
