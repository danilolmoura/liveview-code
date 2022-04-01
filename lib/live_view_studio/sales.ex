defmodule LiveViewStudio.Sales do
  def new_orders(), do: Enum.random(5..20)

  def sales_amount(), do: Enum.random(100..1000)

  def satisfation(), do: Enum.random(95..100)
end
