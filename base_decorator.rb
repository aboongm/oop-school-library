require './nameable'

class Decorator < Nameable
  def initialize(nameable = Nameable.new)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
