class View
  def list_recipes(array_recipes_given_by_the_controller) # <= Array of Recipe instances
    puts "------- Recipes -------"
    array_recipes_given_by_the_controller.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} => #{recipe.description}"
    end
  end


  def ask_user_for_name_and_description
    arguments = {}
    puts "What is the name of you recipe?"
    print '> '
    arguments[:name] = gets.chomp
    puts "What is the description of you recipe?"
    print '> '
    arguments[:description] = gets.chomp
    return arguments
  end

  def ask_for_recipe_index
    puts "Which recipe do you want to delete? (type index)"
    print '> '
    return gets.chomp.to_i - 1
  end
end
