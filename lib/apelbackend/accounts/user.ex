defmodule Apelbackend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_hash, :string
    # virtual fields:
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :password_confirmation])
    |> validate_required([:email, :password, :password_confirmation]) #required fields
    |> validate_format(:email, ~r/@/) # check that email is valid
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password) #check for equality with password_confirmation
    |> unique_constraint(:email) # unique email
    |> put_password_hash() #adding the put password hash to changeset pipeline

  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{ valid?: true, changes: %{password: pass}}
      ->
        put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(pass))
        _
      ->
        changeset

    end
  end
end
