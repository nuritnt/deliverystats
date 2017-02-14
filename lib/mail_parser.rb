require 'mail'
require 'pry'

class MailParser
  def self.parse(email)
    email_string = Mail.read(email).body.parts.first.raw_source
    # email_array = email_string.split("\n")

      # clean up the email_string
      .strip
      email_string.gsub('> ', '').gsub("\n", '').gsub("\r", '').gsub("\t", '').gsub("\", '')
      CGI

      # get kundeninformation with index
      kundeninformation_index = email_array.index("> Kundeninformation\r")
      name = email_array('kundeninformation_index') + 1
      street = email_array('kundeninformation_index') + 3
      zip = email_array('kundeninformation_index') + 4

      # get total with index
      total_index = email_array.index("> Total in CHF\r")
      total = email_array('total_index') + 1

      # get wind and time with index
      date_and_time_index = email_array.index("> Bestelldatum\r")+1
      date_and_time_in_array = date_and_time_in_array.split(' ')
      date = date_and_time_in_array[1]
      window = date_and_time_in_array[2]


  end
end

puts MailParser.parse('test/fixtures/email_1.eml')

# array[array.index("> Kundeninformation")+
# clean up the eml file, checl CGI &gsub
