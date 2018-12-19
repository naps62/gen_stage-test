defmodule Stage.Fetch do
  use GenStage

  def child_spec(opts \\ []) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(opts) do
    GenStage.start_link(
      __MODULE__,
      opts,
      name: __MODULE__
    )
  end

  def init(_opts \\ []) do
    IO.inspect("starting Fetch")
    {:producer, [1, 2, 3, 4, 5]}
  end

  # def add do
  #   Process.send(__MODULE__, :add, [])
  # end

  # def handle_info(:add, _state) do
  #   {:noreply, [], [1, 2, 3, 4, 5]}
  # end

  def handle_demand(_demand, []) do
    IO.inspect("empty")
    {:noreply, [], []}
  end

  def handle_demand(demand, [h | t]) when demand > 0 do
    IO.inspect("demanding #{demand}")
    IO.inspect(t)

    {:noreply, [h], t}
  end
end
