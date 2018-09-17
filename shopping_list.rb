# Modules
module Menu

	def menu
		"Please choose from the menu:
		A. Add item to shopping list
		S. Show shopping list
		D. Delete item from shopping list
		Q. Quit"
	end
end

module Prompter

	def prompt(message, symbol=':::>')
		print message
		print symbol
		gets.chomp
	end
end

# Classes
class List

	attr_reader :shopping_list

	def initialize
		@shopping_list = []
	end

	def add(item)
		@shopping_list << item
	end

	def show
		@shopping_list
	end

end


class Item

	attr_reader :description

	def initialize(description)
		@description = description
	end

	def to_s
		@description
	end

end


# Progam runner
if __FILE__ == $PROGRAM_NAME
	
	include Menu
	include Prompter

	list = List.new
	puts "Hello. Welcome To The Shopping List Maker!"
	until ['q'].include?(user_input = prompt(menu).downcase)
		case user_input
		when 'a'
			list.add(Item.new(prompt('What item would you like to add?')))
		when 's'
			puts list.show
		end
		prompt('Press enter to continue', '')
	end
end