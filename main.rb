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
  
  puts "Enter first name: "
  input1 = gets.chomp
  puts "Enter last name: "
  input2 = gets.chomp
  Contact.create(first_name: input1, last_name: input2, email: input3)
  #end
end

def update_contact
  puts "Enter email: "
  input3 = gets.chomp
  
  temp1 = Contact.find_by("email = ?", input3)
  if temp1
    puts "Enter new email: "
    input3 = gets.chomp
    puts "Enter new first name: "
    input1 = gets.chomp
    puts "Enter new last name: "
    input2 = gets.chomp
    temp1.update(first_name: input1, last_name: input2, email: input3)
  else
    puts "Error: record does not exist"
  end

end

def search
  puts "Enter new email: "
  input3 = gets.chomp
  temp1 = Contact.find_by("email = ?", input3)
  if temp1
    puts "Full name: #{temp1.first_name} #{temp1.last_name}"
    puts "Email: #{temp1.email}"
  else
    puts "Error: record does not exist"
  end
end

def delete_contact
  puts "Enter new email: "
  input3 = gets.chomp
  temp1 = Contact.find_by("email = ?", input3)
  if temp1
    temp1.destroy
  else
    puts "Error: record does not exist"
  end
end

def find_by_first_name
  puts "Enter first name:"
  input1 = gets.chomp
  temp1 = Contact.where("first_name = ?", input1)
  temp1.each do |temp2|
    puts "Full name: #{temp2.first_name} #{temp2.last_name}"
    puts "Email: #{temp2.email}"
  end

end

def find_by_last_name
  puts "Enter last name:"
  input1 = gets.chomp
  temp1 = Contact.where("last_name = ?", input1)
  temp1.each do |temp2|
    puts "Full name: #{temp2.first_name} #{temp2.last_name}"
    puts "Email: #{temp2.email}"
  end

end

def find_emails_by_domain
  puts "Enter email:"
  input1 = gets.chomp
  temp1 = Contact.where("email LIKE ?", "%#{input1}%")
  temp1.each do |temp2|
    puts "Full name: #{temp2.first_name} #{temp2.last_name}"
    puts "Email: #{temp2.email}"
  end

end

puts "Contact List App V3"
loop do
  print %q(
  Menu

  list - show all contact
  create - create a new contact
  search - find contact by email
  update - update contact
  delete - delete contact
  find by last name - return list of contact by last name
  find by first name - return list of contact by first name
  find emails by domain - return list of contact by email
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
  when "find by first name"
    find_by_first_name
  when "find by last name"
    find_by_last_name
  when "find emails by domain"
    find_emails_by_domain
  when "list"
    list
  when "search"
    search
  when "quit"
    exit
  else
    puts "Error: invalid command" 
  end
end