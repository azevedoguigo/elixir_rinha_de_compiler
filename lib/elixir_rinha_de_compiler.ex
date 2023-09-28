defmodule ElixirRinhaDeCompiler do
  def execute(file_path) do
    {:ok, raw} = File.read(file_path)

    {:ok, ast} = Jason.decode(raw)

    case Interpreter.interpreter(ast["expression"]) do
      {:ok, message} -> message
      {:error, reason} -> reason
    end
  end
end
