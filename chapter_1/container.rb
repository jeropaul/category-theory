
module Container

  def self.identity(identity)
    identity
  end

  def self.compose(function_a, function_b)
    ->(arg) do
      function_a.(function_b.(arg))
    end
  end

end