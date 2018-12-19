defmodule Stage.Application do
  use Application

  alias Stage.{A, B, C}

  def start(_type, _args) do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      Stage.Fetch,
      Stage.Handle
      # {Stage.A, [5]},
      # Stage.B,
      # Stage.C
    ]

    # # starting from zero
    # {:ok, a} = A.start_link(0)
    # # multiply by 2
    # {:ok, b} = B.start_link(2)
    # # state does not matter
    # {:ok, c} = C.start_link()

    # GenStage.sync_subscribe(c, to: b)
    # GenStage.sync_subscribe(b, to: a)

    Supervisor.init(children, strategy: :one_for_one)
  end
end
