defmodule ProductWeb.ModalComponent do
  @moduledoc """
  Module Modal Component
  """
  use ProductWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
      Modal Component
    """
  end
end
