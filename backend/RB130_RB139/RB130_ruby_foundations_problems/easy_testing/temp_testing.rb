class TempTest
  attr_reader :nil_var
  def initialize(num)
    @value = num
  end

  def odd?
    @value.odd?
  end

  def downcase
    'xyz'
  end
end

