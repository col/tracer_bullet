defmodule TracerBullet.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: TracerBullet.Plug, options: [port: 4001]}
    ]

    opts = [strategy: :one_for_one, name: TracerBullet.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
