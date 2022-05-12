defmodule Rockelivery.Users.Delete do
  alias Rockelivery.{Repo, Error}
  alias Rockelivery.Users.User

  def call(id) do
    with %User{} = user <- Repo.get(User, id) do
      Repo.delete(user)
    else
      nil -> {:error, Error.build_user_not_found_error()}
    end
  end
end
