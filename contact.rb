class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note, :full_name

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note='N/A')
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
    @@contacts.find { |contact| contact.id == find_id }
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
    #case for when attribute is equal to the state name, find the contact with that info
    case attribute
    when "first_name"
      result = @@contacts.select { |contact| contact.first_name == value}
      return result[0] #prints on screen the first result found

    when "last_name"
      result = @@contacts.select { |contact| contact.last_name == value}
      puts result[0] #prints on screen the first result found

    when "email"
      result = @@contacts.select { |contact| contact.email == value}
      puts result[0] #prints on screen the first result found

    when "note"
      result = @@contacts.select { |contact| contact.note == value} #returns
      puts result[0] #prints on screen the first result found

    end

  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    contact_to_delete_id = self.id #find ID number
    @@contacts.delete_if { |contact| contact_to_delete_id == contact.id }  #will iterate throught the array and find the contact with the same ID number and then delete it
    # @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end

lauren = Contact.create('Lauren', 'Rosentzveig', 'lauren.rosentzveig@gmail.com', 'winning at life')
shawn = Contact.create('Shawn', 'Verge', 'shawn.verge@sympatico.ca', 'Every day, becomes more awesome than the next')
