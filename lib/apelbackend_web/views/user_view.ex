defmodule ApelbackendWeb.UserView do
  use ApelbackendWeb, :view
  alias ApelbackendWeb.UserView

  def render("index.json", %{users: users}) do
    %{result: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{result: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, email: user.email, password_hash: user.password_hash}
  end

  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end

  def render("custom.json", %{error: message}) do
    %{error: "Server error", message: message}
  end
end
