defmodule MamWirusa.SpreadTest do
  use MamWirusa.DataCase

  alias MamWirusa.Spread

  describe "cases" do
    alias MamWirusa.Spread.Case

    @valid_attrs %{infected_at: "2010-04-17T14:00:00Z", information: "some information"}
    @update_attrs %{infected_at: "2011-05-18T15:01:01Z", information: "some updated information"}
    @invalid_attrs %{infected_at: nil, information: nil}

    def case_fixture(attrs \\ %{}) do
      {:ok, case} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Spread.create_case()

      case
    end

    test "list_cases/0 returns all cases" do
      case = case_fixture()
      assert Spread.list_cases() == [case]
    end

    test "get_case!/1 returns the case with given id" do
      case = case_fixture()
      assert Spread.get_case!(case.id) == case
    end

    test "create_case/1 with valid data creates a case" do
      assert {:ok, %Case{} = case} = Spread.create_case(@valid_attrs)
      assert case.infected_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert case.information == "some information"
    end

    test "create_case/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Spread.create_case(@invalid_attrs)
    end

    test "update_case/2 with valid data updates the case" do
      case = case_fixture()
      assert {:ok, %Case{} = case} = Spread.update_case(case, @update_attrs)
      assert case.infected_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert case.information == "some updated information"
    end

    test "update_case/2 with invalid data returns error changeset" do
      case = case_fixture()
      assert {:error, %Ecto.Changeset{}} = Spread.update_case(case, @invalid_attrs)
      assert case == Spread.get_case!(case.id)
    end

    test "delete_case/1 deletes the case" do
      case = case_fixture()
      assert {:ok, %Case{}} = Spread.delete_case(case)
      assert_raise Ecto.NoResultsError, fn -> Spread.get_case!(case.id) end
    end

    test "change_case/1 returns a case changeset" do
      case = case_fixture()
      assert %Ecto.Changeset{} = Spread.change_case(case)
    end
  end
end
