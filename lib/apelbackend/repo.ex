defmodule Apelbackend.Repo do
  use Ecto.Repo,
    otp_app: :apelbackend,
    adapter: Ecto.Adapters.Postgres
end
