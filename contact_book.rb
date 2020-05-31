#### Objective ####
# Build a Contact List
# 1.) Create a menu that allows a user to:
# 2.) Create contact
# 3.) View all contacts
# 4.) Exit
## The program should run until exit

#### Bonus ####
# 1.) Delete Contact
# 2.) Edit Contact

@contacts = []

puts "\nWelcome to your contact book!"
def main_menu
  puts "\n"
  puts "Main Menu:"
  puts "1.) Create Contact"
  puts "2.) View All Contacts"
  puts "3.) Delete Contacts"
  puts "4.) Edit Contact"
  puts "5.) Exit"

  user_input = gets.to_i
  case user_input
    when 1
      contact_info
      main_menu
    when 2
      view_contacts
      main_menu
    when 3
      remove_contact
      main_menu
    when 4
      edit_contact
      main_menu
    when 5
      puts "See you later!\n"
      exit
    else
      puts "Wrong input. Try again"
      user_input
    end
end

def contact_info
  contact = Hash.new()
  puts "Enter your full name:"
  contact[:name] = gets.chomp
  puts "\nEnter your email:"
  contact[:email] = gets.chomp
  puts "\nEnter your phone number:"
  contact[:phone_number] = gets.chomp
  @contacts << contact
end

def view_contacts
  puts "Contacts:\n"
  @contacts.each_with_index do |contact, index| 
    puts "#{index + 1} name: #{contact[:name]} | email: #{contact[:email]} | phone number: #{contact[:phone_number]}"
  end
end

def remove_contact
  puts "Which contact would you like to remove?"
  view_contacts
  input = gets.chomp.to_i
  if input > 0 && input <= @contacts.length
    @contacts.delete_at(input - 1)
  else
    puts "Wrong input. Try again"
    remove_contacts
  end
end

def edit_contact
  puts "What contact would you like to edit?"
  view_contacts
  input = gets.chomp.to_i
  if input > 0 && input <= @contacts.length
    @contacts.delete_at(input - 1)
    contact_info
  else
    puts "Wrong input. Try Again"
    edit_contact
  end

end

main_menu