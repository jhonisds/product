defmodule ProductWeb.DeviceLive.DeviceComponent do
  use ProductWeb, :live_component

  alias Product.Devices

  def render(assigns) do
    IO.inspect(assigns, label: "DEVICE COMPONENT")

    ~L"""
        <div class="row">
          <div class="column column-10">
            <%= @device.id %>
          </div>
          <div class="column column-10">
            <%= @device.name %>
          </div>
          <div class="column column-10">
            <%= @device.sku %>
          </div>
          <div class="column column-10">
            <%= @device.price %>
          </div>
          <div class="column column-10">
            <a href="#" phx-click="duplicate" phx-target="<%= @myself %>">
             duplicate
            </a>
          </div>
        </div>
    """
  end

  def handle_event("duplicate", _, socket) do
    device = socket.assigns.device
    insert = %{name: device.name, sku: device.sku, price: device.price}
    Devices.create_device(insert)
    {:noreply, socket}
  end
end
