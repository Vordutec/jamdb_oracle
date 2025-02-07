defmodule Jamdb.Oracle.UUID do
  use Ecto.Type

  def type, do: :uuid

  def cast(uuid) when is_binary(uuid) do
    Ecto.UUID.cast(uuid)
  end

  def cast(_), do: :error

  def load(uuid) do
    Ecto.UUID.load(uuid)
  end

  def dump(uuid) do
    {:ok, uuid |> format_guid()}
  end

  def autogenerate do
    Ecto.UUID.generate()
  end

  def format_guid(uuid) do
    uuid
    |> String.upcase()
    |> String.pad_leading(32, "0")
    |> String.replace("-", "")
  end
end
