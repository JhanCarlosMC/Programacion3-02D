defmodule ComplejoB do
  def f(n) when n <= 1, do: n + 2

  def f(n) when rem(n, 2) == 0 do
    f(n - 1) - rem(n, 3) + f(div(n, 2))
  end

  def f(n) do
    g(n - 2, rem(n, 4))
  end

  defp g(a, 0), do: f(a - 1)
  defp g(a, r), do: f(a) * (r + 1)
end

ComplejoB.f(7)
