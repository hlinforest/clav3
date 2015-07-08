require_relative 'setup'
require 'pry'
def list
  temp_list = Contact.all
  #binding.pry
  temp_list.each do |temp_contact|
    puts "Full name: #{temp_contact.first_name} #{temp_contact.last_name}"
    puts "Email: #{temp_contact.email}"
  end
end

def new_contact
  puts "Enter email: "
  input3 = gets.chomp
  # if Contact.find_by("email = ?", input3)
  #   puts "Error: Record already exist"
  # else
  puts "Enter first name: "
  input1 = gets.chomp
  puts "Enter last name: "
  input2 = gets.chomp
  Contact.create(first_name: input1, last_name: input2, email: input3)
  #end
end

def search
  
end
puts "Contact List App V2"
loop do
  print %q(
  Menu

  list - show all contact
  create - create a new contact
  search - find contact by last name or first name or email
  update - update contact
  delete - delete contact
  find last name - find contact by last name
  find first name - find contact by first name
  quit - exit program
  > )

  command = gets.chomp.downcase

  case command
  when "create"
    new_contact
  when "update"
    update_contact
  when "delete"
    delete_contact
  when "find first name"
    find_first_name
  when "find last name"
    find_last_name
  when "list"
    list
  when "quit"
    exit
  else
    puts "Error: invalid command" 
  end
end