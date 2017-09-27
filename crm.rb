require "./contact.rb"

class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
    while true # repeat indefinitely
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
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
    when 6 then abort("Byeeeee")
    # Finish off the rest for 3 through 6
    # To be clear, the methods add_new_contact and modify_existing_contact
    # haven't been implemented yet
  end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    print "Enter id of contact you wish to change: "
    user_id = gets.chomp.to_i
    contact = Contact.find(user_id)

    print 'Enter attribute you wish to change: '
    original_value = gets.chomp

    print 'Enter new attribute: '
    new_value = gets.chomp

    contact.update(original_value, new_value)
    puts "Updated contact: #{contact.full_name}"
  end

  def delete_contact
    print "Enter id of contact you wish to delete: "
    user_id = gets.chomp.to_i
    contact = Contact.find(user_id)

    contact.delete
  end

  def display_all_contacts
    puts Contact.all.inspect
  end

  def search_by_attribute
    print "Enter for value you want to search for: "
    user_value = gets.chomp
    Contact.find_by(user_value)
  end


end

a_crm_app = CRM.new("josh")
a_crm_app.main_menu
