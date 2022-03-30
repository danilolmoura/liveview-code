defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  def mount(_params, _session, socket) do
    # set initial state of brightness to 10
    socket = assign(socket, :brightness, 10)
    IO.inspect(socket)
    {:ok, socket}
  end

  def render(assigns) do
    IO.inspect(assigns)

    ~L"""
    <h1>Front Porch Light<h1>
    <div id="light">
      <div class="meter">
        <span style="width: <%= @brightness %>%">
          <%= @brightness %>%
        </span>
      </div>

      <button phx-click="off">
        <img src="images/light-off.svg">
      </button>


      <button phx-click="down">
        <img src="images/down.svg">
      </button>

      <button phx-click="up">
        <img src="images/up.svg">
      </button>

      <button phx-click="on">
        <img src="images/light-on.svg">
      </button>
    </div>
    """
  end

  @spec handle_event(<<_::16>>, any, map) :: {:noreply, map}
  def handle_event("on", _unsigned_params, socket) do
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end

  @spec handle_event(<<_::16>>, any, map) :: {:noreply, map}
  def handle_event("off", _unsigned_params, socket) do
    socket = assign(socket, :brightness, 0)
    {:noreply, socket}
  end

  def handle_event("up", _unsigned_params, socket) do
    socket = update(socket, :brightness, &(&1 + 10))
    {:noreply, socket}
  end

  def handle_event("down", _unsigned_params, socket) do
    socket = update(socket, :brightness, &(&1 - 10))
    {:noreply, socket}
  end

  # mout initializes the state of liveview process by assign values to the socket
  # render render a view with a "brightness" param and it has four bottons
  # It also has handle_events calllback for each inbound event, this callbacks change the state of socket by assign or update

  # WHENEVER the state of the socket changes render is automatically called
end
