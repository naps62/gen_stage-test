defmodule Stage.C do
  use GenStage

  def child_spec(opts \\ []) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link() do
    GenStage.start_link(__MODULE__, :ok)
  end

  def init(_) do
    {:consumer, :a_state_of_matter_or_a_matter_of_state}
  end

  def handle_events(events, _from, state) do
    # Wait for a second.
    Process.sleep(1000)

    # Inspect the events.
    IO.inspect(events)

    # We are a consumer, so we would never emit items.
    {:noreply, [], state}
  end
end
