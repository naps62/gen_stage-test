defmodule Stage.B do
  use GenStage

  def child_spec(opts \\ []) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(number) do
    GenStage.start_link(__MODULE__, number)
  end

  def init(number) do
    {:producer_consumer, number}
  end

  def handle_events(events, _from, number) do
    events = Enum.map(events, &(&1 * number))
    {:noreply, events, number}
  end
end
