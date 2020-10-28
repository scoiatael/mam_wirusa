defmodule MamWirusaWeb.CaseController do
  use MamWirusaWeb, :controller

  alias MamWirusa.Spread
  alias MamWirusa.Spread.Case

  def new(conn, _params) do
    render(conn, "new.html", changeset: Case.changeset(%Case{}, %{}))
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
end
