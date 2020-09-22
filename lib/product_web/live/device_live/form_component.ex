defmodule ProductWeb.DeviceLive.FormComponent do
  use ProductWeb, :live_component

  def render(assigns) do
    IO.inspect("FORM COMPONENT")

    ~L"""
      FORM COMPONENT
    """
  end
end
