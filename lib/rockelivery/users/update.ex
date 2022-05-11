defmodule Rockelivery.Users.Update do
  alias Ecto.UUID
  alias Rockelivery.{Repo, Error}
  alias Rockelivery.Users.User

  def call(%{"id" => id} = params) do
    with {:ok, _uuid} <- UUID.cast(id),
         %User{} = user <- Repo.get(User, id) do
      do_update(user, params)
    else
      :error -> {:error, Error.build_id_format_error()}
      nil -> {:error, Error.build_user_not_found_error()}
    end
  end

  def do_update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
