defmodule ProWebb.Repo do
  use Ecto.Repo,
    otp_app: :proWebb,
    adapter: Ecto.Adapters.Postgres
end
