require './nameable'

class Decorator < Nameable
  attr_accessor :component

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @component.correct_name
  end
end
