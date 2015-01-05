defmodule PresentPicker do
  def pick(people, nbr_wanted_solutions, constraints) do
    {solutions, nbr_found_solutions} = _pick(people, people, [],{[],0}, nbr_wanted_solutions, constraints)
    solutions
  end

  defp _pick(_, [], current, {solutions, nbr_found_solutions}, _, _) do
    solutions = List.insert_at(solutions, -1, current)
    {solutions, nbr_found_solutions + 1}
  end

  defp _pick([head | tail], receivers, current, {solutions, nbr_found_solutions}, nbr_wanted_solutions, constraints) do
    List.delete(receivers, head) |> Enum.reduce({solutions, nbr_found_solutions}, fn  receiver, {solutions, nbr_found_solutions} ->
      if nbr_found_solutions < nbr_wanted_solutions  && do_not_contains(current, constraints)do
        current = List.insert_at(current, -1, {head, receiver})
        {solutions, nbr_found_solutions} = _pick(tail,  List.delete(receivers, receiver), current, {solutions, nbr_found_solutions}, nbr_wanted_solutions, constraints)
      end
      {solutions, nbr_found_solutions}
    end)
  end

  defp do_not_contains(current, constraints) do
    true
  end
end

PresentPicker.pick(["Christophe", "Mathilde", "Sarah", "David", "Denis", "Bea", "Nico", "Ben", "Mémé", "Robin", "Sylvie", "Anno", "Cyrille", "Dirk", "Isabelle", "Bernard", "Anne-Marie"], 5, [])


!Enum.find([{"Christophe", "Mathilde"}, {"Mathilde", "Christophe"}, {"Sarah", "David"},
  {"David", "Sarah"}, {"Denis", "Bea"}, {"Bea", "Denis"}, {"Nico", "Ben"},
  {"Ben", "Nico"}, {"Mémé", "Robin"}, {"Robin", "Mémé"}, {"Sylvie", "Anno"},
  {"Anno", "Sylvie"}, {"Cyrille", "Dirk"}, {"Dirk", "Isabelle"},
  {"Isabelle", "Anne-Marie"}, {"Bernard", "Cyrille"},
  {"Anne-Marie", "Bernard"}], &(&1 =={"Cyrille","Bernard"}))