require_relative 'recipe'
require_relative 'view'

class Controller

  def initialize(previously_created_instance_of_cookbook)
    @cookbook = previously_created_instance_of_cookbook
    @view = View.new
  end

  def list
    # binding.pry
    #Retrieve all the recipes
    array_of_recipes_wioth_previously_the_name_array_of_recipes_in_class = @cookbook.recipes #We call the method recipes on Cookbook instance which returns array_of_recipes_in_class
    #Give the Array of recipes to the view
    @view.list_recipes(array_of_recipes_wioth_previously_the_name_array_of_recipes_in_class)
  end

  def create
    arguments = @view.ask_user_for_name_and_description
    new_recipe = Recipe.new(arguments)
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    list
    index = @view.ask_for_recipe_index
    @cookbook.remove_recipe(index)
  end

end
