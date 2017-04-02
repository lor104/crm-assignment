class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id +=1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(find_id)
    @@contacts.each do |contact|
      if contact.id == find_id
        return contact
      else
        return "Contact not found"
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)
    if attribute == "first_name"
      @first_name = new_value
    elsif attribute == "last_name"
      @last_name = new_value
    elsif attribute == "email"
      @email = new_value
    elsif attribute == "note"
      @note = new_value
    else
      puts "error: that attribute doesn't exist"
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    # @@contacts.each do |contact|
    #   if attribute == "first_name" && contact.first_name == value
    #     return contact
    #   else
    #     return "contact does not exist"
    #   end
    #
    #   if attribute == "last_name" && contact.last_name == value
    #     return contact
    #   else
    #     return "contact does not exist"
    #   end
    #
    #   if attribute == "email" && contact.email == value
    #     return contact
    #   else
    #     return "contact does not exist"
    #   end
    #
    #   if attribute == "note" && contact.note == value
    #     return contact
    #   else
    #     return "contact does not exist"
    #   end
    # end

    #case for when attribute is equal to the state name, find the contact with that info
    case attribute
    when "first_name"
      result = @@contacts.select { |contact| contact.first_name == value} #returns an array
      if result.length == 0 #if the array length is 0, then no contact was found with that first name of "value"
        puts "no contact exists with the first name: #{value}"
      else
        return result[0] #prints on screen the first result found
      end

    when "last_name"
      result = @@contacts.select { |contact| contact.last_name == value} #returns an array
      if result.length == 0 #if the array length is 0, then no contact was found with that first name of "value"
        puts "no contact exists with the last name: #{value}"
      else
        puts result[0] #prints on screen the first result found
      end

    when "email"
      result = @@contacts.select { |contact| contact.email == value} #returns an array
      if result.length == 0 #if the array length is 0, then no contact was found with that first name of "value"
        puts "no contact exists with the email: #{value}"
      else
        puts result[0] #prints on screen the first result found
      end

    when "note"
      result = @@contacts.select { |contact| contact.note == value} #returns an array
      if result.length == 0 #if the array length is 0, then no contact was found with that first name of "value"
        puts "no contact exists with the note: #{value}"
      else
        puts result[0] #prints on screen the first result found
      end
    end

  end

  # This method should delete all of the contacts
  def self.delete_all

  end

  def full_name

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.

end
