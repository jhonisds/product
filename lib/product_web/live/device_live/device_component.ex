defmodule ProductWeb.DeviceLive.DeviceComponent do
  use ProductWeb, :live_component

  def render(assigns) do
    IO.inspect(assigns)

    ~L"""
        Device Component
    """
  end
end
