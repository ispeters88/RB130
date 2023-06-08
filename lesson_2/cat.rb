class Cat
  attr_accessor :name, :purr_factor

  def initialize(name, purr)
    @name = name
    @purr_factor = purr
  end

  def miaow
    "#{name} is miaowing"
  end
end