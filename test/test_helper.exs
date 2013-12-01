Dynamo.under_test(Sample.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Sample.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
