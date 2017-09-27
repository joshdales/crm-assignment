class Contact
  @@contact_list = []
  @@id = 1
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note = 'none')
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note = 'none')
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contact_list << new_contact
    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contact_list
  end

  # Readers
  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  def id
    @id
  end

  # Writers
  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def note=(note)
    @note = "#{@note} #{note}"
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contact_list.each do |contact|
      if contact.id == id
        return "Name: #{contact.full_name} \nEmail: #{contact.email} \nNotes: #{contact.note} \nid: #{contact.id}"
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(original_value, new_value)
    if original_value == @first_name
      @first_name = new_value
    elsif original_value == @last_name
      @last_name = new_value
    elsif original_value == @email
      @email = new_value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(user_value)
    @@contact_list.each do |contact|
      if contact.id == user_value || contact.first_name == user_value || contact.last_name == user_value || contact.email == user_value || contact.full_name == user_value
        return "Name: #{contact.full_name} \nEmail: #{contact.email} \nNotes: #{contact.note} \nid: #{contact.id}"
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all

  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.

end
