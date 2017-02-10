class Recipe

  attr_reader :name, :description
  def initialize(args)
    fail "Name is mandatory" unless args[:name]

    @name = args[:name]
    @description = args[:description]
  end
end
