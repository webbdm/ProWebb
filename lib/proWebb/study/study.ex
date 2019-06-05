defmodule ProWebb.Study do
  @moduledoc """
  The ProWebb context.
  """

  import Ecto.Query, warn: false
  alias ProWebb.Repo

  alias ProWebb.Study.Note
  alias ProWebb.Study.StudySession

  @doc """
  Returns the list of notes.
  ## Examples
      iex> list_notes()
      [%Note{}, ...]
  """
  def list_notes do
    Repo.all(Note)
  end

  @doc """
  Gets a single Note.
  Raises `Ecto.NoResultsError` if the Note does not exist.
  ## Examples
      iex> get_Note!(123)
      %Note{}
      iex> get_Note!(456)
      ** (Ecto.NoResultsError)
  """
  def get_Note!(id), do: Repo.get!(Note, id)

  @doc """
  Creates a Note.
  ## Examples
      iex> create_Note(%{field: value})
      {:ok, %Note{}}
      iex> create_Note(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_Note(attrs \\ %{}) do
    %Note{}
    |> Note.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a Note.
  ## Examples
      iex> update_Note(Note, %{field: new_value})
      {:ok, %Note{}}
      iex> update_Note(Note, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_Note(%Note{} = Note, attrs) do
    Note
    |> Note.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Note.
  ## Examples
      iex> delete_Note(Note)
      {:ok, %Note{}}
      iex> delete_Note(Note)
      {:error, %Ecto.Changeset{}}
  """
  def delete_Note(%Note{} = Note) do
    Repo.delete(Note)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking Note changes.
  ## Examples
      iex> change_Note(Note)
      %Ecto.Changeset{source: %Note{}}
  """
  def change_Note(%Note{} = Note) do
    Note.changeset(Note, %{})
  end

  # Study Sessions

  def list_study_sessions do
    Repo.all(StudySessions)
  end

  def get_StudySession!(id), do: Repo.get!(StudySession, id)
end
