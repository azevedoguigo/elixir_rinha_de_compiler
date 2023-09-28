defmodule Interpreter do
  def interpreter(node) do
    evaluate_kind(node)
  end

  defp evaluate_kind(%{"kind" => kind} = node) when kind == "Str", do: node["value"]

  defp evaluate_kind(%{"kind" => kind} = node) when kind == "Print" do
    term = interpreter(node["value"])
    case is_bitstring(term) do
      true ->
        {:ok, term}
      false ->
        {:error, "Error: Unexpected term!"}
    end
  end

  defp evaluate_kind(%{"kind" => kind} = _node), do: {:error, "Error: Unknown node kind: #{kind}!"}
end
