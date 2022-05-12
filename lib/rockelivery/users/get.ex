defmodule Rockelivery.Users.Get do
  alias Rockelivery.Users.User
  alias Rockelivery.{Repo, Error}

  def by_id(id) do
    with %User{} = user <- Repo.get(User, id) do
      {:ok, user}
    else
      nil -> {:error, Error.build_user_not_found_error()}
    end
  end
end
