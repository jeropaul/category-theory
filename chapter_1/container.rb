
module Container

  def self.identity(identity)
    identity
  end

  def self.compose(a, b)
    ->(arg) do
      a.call(b.call(arg))
    end
  end

end