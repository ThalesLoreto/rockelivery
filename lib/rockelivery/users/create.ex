defmodule Rockelivery.Users.Create do
  alias Rockelivery.Error
  alias Rockelivery.Repo
  alias Rockelivery.Users.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %Error{status: :bad_request, result: result}}
end
