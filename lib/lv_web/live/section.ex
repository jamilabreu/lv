defmodule LvWeb.SectionLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
      <div phx-hook="SimpleBar" style="background: red; height: 100px">
        <%= for _ <- 1..10 do %><div>First Scrollable Data</div><% end %>
      </div>
      <br>
      <button phx-click="add_second">Add Second Element</button>
      <%= if @second do %>
        <div phx-hook="SimpleBar" style="background: green; height: 100px; margin-top: 20px">
          <%= for _ <- 1..10 do %><div>Second Scrolls, First Element Loses Simplebar</div><% end %>
        </div>
        <br>
        <button phx-click="remove_second">Remove Second Element</button>
      <% end %>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, second: false)}
  end

  def handle_event("add_second", _, socket) do
    {:noreply, assign(socket, second: true)}
  end

  def handle_event("remove_second", _, socket) do
    {:noreply, assign(socket, second: false)}
  end
end
