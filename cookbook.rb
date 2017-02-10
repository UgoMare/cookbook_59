require 'csv'

class Cookbook

  # attr_reader :recipes
  def initialize(csv_file)
    @csv_file = csv_file
    @array_of_recipes_in_class = [] #Array of Recipe instances
    load_csv
  end

  def add_recipe(new_recipe)
    if @array_of_recipes_in_class.include? new_recipe
      puts "The `new_recipe` is already in the Cookbook"
    elsif !new_recipe.is_a? Recipe
      puts "Wrong type for `new_recipe`"
    else
      @array_of_recipes_in_class << new_recipe
      write_csv
    end
  end

  def remove_recipe(index)
    @array_of_recipes_in_class.delete_at(index)
    write_csv
  end

  def recipes #Instance method
    return @array_of_recipes_in_class # !! Return the @array_of_recipes_in_class outside of the class
  end

  private
  def load_csv
    CSV.foreach(@csv_file) do |row|
      recipe = Recipe.new(name: row[0], description: row[1])
      @array_of_recipes_in_class << recipe
    end
  end

  def write_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @array_of_recipes_in_class.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
