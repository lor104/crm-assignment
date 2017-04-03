require_relative 'contact'

class CRM

  def initialize

  end

  def main_menu
    while true #makes it repeat indefinitely, since it will never be false
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact # add first name, last name, email, note
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print "Enter a Note: "
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact #find contact by ID number, ask for attribute to modify, then modify attribute
    print 'Enter Contact ID: '
    id = gets.chomp.to_i
    contact = Contact.find(id)
    print "Name: #{contact.first_name} #{contact.last_name} | Email: #{contact.email} | Note: #{contact.note} | ID: #{contact.id} \n"

    print "List of attributes you can change: \n"
    print "first_name \n"
    print "last_name \n"
    print "email \n"
    print "note \n"
    print 'Enter the attribute you want to change: '
    attribute = gets.chomp
    print 'Enter the new value for that attribute: '
    value = gets.chomp

    contact.update(attribute, value)
    print "Name: #{contact.first_name} #{contact.last_name} | Email: #{contact.email} | Note: #{contact.note} | ID: #{contact.id} \n"

  end

  def delete_contact #ask for contact to delete, then delete it
    print 'Enter Contact ID of contact to delete: '
    id = gets.chomp.to_i
    contact = Contact.find(id)
    # contact_from_id.each do |contact|
      print "Contact to delete: \n"
      # print "Name: #{contact.first_name} #{contact.last_name}, Email: #{contact.email}, Note: #{contact.note} \n"
      print "Are you sure you want to delete? yes or no? \n"
      answer = gets.chomp
      if answer == 'yes'
        Contact.find(id).delete
        print "Contact was deleted"
      elsif answer == 'no'
        main_menu
      end
    # end
  end

  def display_all_contacts #display contact list, iterate through contacts list and display all info (full name, email, note)
    contacts = Contact.all
    contacts.each do |contact|
      print "Name: #{contact.full_name} | Email: #{contact.email} | Note: #{contact.note} | ID: #{contact.id} \n"
    end
    return
  end

  def search_by_attribute #ask for attribute to search for, ask for value to search for, then search and display

  end


end

crm = CRM.new
crm.main_menu
