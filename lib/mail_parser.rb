require 'mail'

class MailParser
  def self.parse(email)
    email_string = Mail.read(email).body.parts.first.raw_source
    email_array = email_string.split("\n")
  end
end

puts MailParser.parse('test/email.eml')
