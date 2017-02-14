require 'mail'

class MailParser
  def self.parse(email)
    email_string = Mail.read(email).body.parts.first.raw_source
    email_array = email_string.split("\n")
    def get_index_of_array(string)
      kundeninformation = email_array.index("> Kundeninformation\r")
      date_and_window = kundeninformation -= 1
      name = [kundeninformation += 1]
      street = [kundeninformation += 3]
      zip = [kundeninformation += 4]
    end
  end
end

puts MailParser.parse('test/email.eml')

# mail_array[37] will print out the array
