defmodule LiveViewStudioWeb.LicenseLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.Licenses

  def mount(_params, _session, socket) do
    IO.puts "MOUNT #{inspect(self())}"
    socket = assign(socket, seats: 2, amount: Licenses.calculate(2))
    {:ok, socket}
  end

  def render(assigns) do
    IO.puts "RENDER #{inspect(self())}"

    ~L"""
    <h1>TEAAM LICENSE<h1>
    <div id="license">
      <div class="card">
        <div class="content">
          <div class="seats">
            <img src="images/license.svg">
            <span>
              Your license is currently for <strong>2</strong> seats.
            </span>
          </div>

          <form>
            <input type="range" min="1" max="10" name="seats" value="2" />
          </form>

          <div class="amount">
            $40
          </div>
        </div>
      </div>
    </div>
    """
  end
end
