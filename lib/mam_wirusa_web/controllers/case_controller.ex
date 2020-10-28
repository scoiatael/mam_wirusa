defmodule MamWirusaWeb.CaseController do
  use MamWirusaWeb, :controller

  alias MamWirusa.Spread
  alias MamWirusa.Spread.Case

  def new(conn, _params) do
    changeset = Spread.change_case(%Case{})
    render(conn, "new.html", changeset: changeset)
  end

  def index(conn, _params) do
    redirect(conn, to: Routes.page_path(conn, :index))
  end

  def create(conn, %{"case" => case_params}) do
    case Spread.create_case(case_params) do
      {:ok, _case} ->
        conn
        |> put_flash(:info, "Case created successfully.")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    case = Spread.get_case!(id)
    render(conn, "show.html", case: case)
  end

  def edit(conn, %{"id" => id}) do
    case = Spread.get_case!(id)
    changeset = Spread.change_case(case)
    render(conn, "edit.html", case: case, changeset: changeset)
  end

  def update(conn, %{"id" => id, "case" => case_params}) do
    case = Spread.get_case!(id)

    case Spread.update_case(case, case_params) do
      {:ok, case} ->
        conn
        |> put_flash(:info, "Case updated successfully.")
        |> redirect(to: Routes.case_path(conn, :show, case))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", case: case, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    case = Spread.get_case!(id)
    {:ok, _case} = Spread.delete_case(case)

    conn
    |> put_flash(:info, "Case deleted successfully.")
    |> redirect(to: Routes.case_path(conn, :index))
  end
end
