defmodule LiveViewStudio.Stores do
  @spec search_by_zip(any) :: any
  def search_by_zip(zip) do
    :timer.sleep(2000)

    list_stores()
    |> Enum.filter(&(&1.zip == zip))
    |> IO.inspect(label: "result")
  end

  def search_by_city(city) do
    list_stores()
    |> Enum.filter(&(&1.city == city))
  end

  def list_stores do
    [
      %{
        name: "Casa 1",
        street: "312 Odilon de Araújo",
        phone_number: "(21) 2222-0000",
        city: "Rio de Janeiro, RJ",
        zip: "20780330",
        open: true,
        hours: "8am - 10pm M-F"
      },
      %{
        name: "Casa 2",
        street: "301 Vaz de Caminha",
        phone_number: "(21) 2222-1111",
        city: "Rio de Janeiro, RJ",
        zip: "20775160",
        open: true,
        hours: "9am - 11pm M-F"
      },
      %{
        name: "Casa 3",
        street: "301 Joaquim Meier",
        phone_number: "(21) 2222-22222",
        city: "Rio de Janeiro, RJ",
        zip: "20725050",
        open: true,
        hours: "11am - 12pm M-F"
      }
    ]
  end
end
