defmodule PresentPicker do
  def pick(people) do
    _pick(people, people, [], [])
  end

  def _pick(_, [], current, solutions) do
    solutions = List.insert_at(solutions, -1, current)
    solutions
  end

  def _pick([head | tail], receivers, current, solutions) do
    List.delete(receivers, head) |> Enum.reduce(solutions, fn  receiver, solutions ->
      current = List.insert_at(current, -1, [head, receiver])
      _pick(tail,  List.delete(receivers, receiver), current, solutions)
    end)
  end
end

PresentPicker.pick(["Christophe", "Mathilde", "Sarah", "David", "Denis", "Bea", "Nico", "Ben"])